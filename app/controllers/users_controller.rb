class UsersController < ApplicationController
  before_filter :declared_user, except: [:create, :login_mobile, :register_mobile]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Pomyślnie zarejestrowano"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def login_mobile
    @user = User.new
    if !params[:email].nil? and !params[:password].nil?
      @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        render json: @user
      else
        @user = User.new
        render json: @user
      end
    else
      @user = User.new
      render json: @user
    end
  end

  def register_mobile
    @user = User.new(user_mobile)
    @user.activated = true
    if @user.save
      render json: {status: "success", message: "Pomyślnie zarejestrowano", user: @user}
    else
      if !User.find_by(email: params[:email].downcase).blank?
        render json: { status: "failure", message: "Osoba o tym emailu istnieje"}
      elsif !User.find_by(login: params[:login]).blank?
        render json: {status: "failure", message: "Osoba o tym loginie istnieje"}
      else
        render json: {status: "failure", message: "Niepoprawne dane"}
      end
    end

  end

  private

    def declared_user
      if logged_in?
        if Protege.find_by(user_id: current_user.id.to_i).nil? and Trainer.find_by(user_id: current_user.id.to_i).nil?
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                                   :password_confirmation, :login)
    end

    def user_mobile
      params.permit(:name, :surname, :email, :password, :password_confirmation, :login)
    end

end
