class UsersController < ApplicationController
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
      redirect_to @user
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

  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                                   :password_confirmation, :login)
    end

end
