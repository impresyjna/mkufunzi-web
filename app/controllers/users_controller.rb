class UsersController < ApplicationController
  before_filter :declared_user, except: [:create, :login_mobile, :register_mobile, :user_exists_mobile]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
    @gender = [['Kobieta','K'],['Mężczyzna','M']]
    @blood_type = BloodType.pluck(:name, :id)
    @eye_color = EyeColor.pluck(:name, :id)
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Pomyślnie zmieniono"
      redirect_to edit_profile_path
    else
      flash[:danger] = "Nie udalo się edytować"
      redirect_to edit_profile_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Proszę sprawdź swój email, aby aktywować konto"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def login_mobile
    @user = User.new
    if !params[:email].nil? and !params[:password].nil?
      @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        render json: {user: @user, protege: @user.protege, card: @user.protege.card}
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
    if @user.save
      @protege = Protege.new(user_id: @user.id)
      @protege.save
      @cart = Card.new(protege_id: @protege.id)
      @cart.save
      render json: {status: "success", message: "Pomyślnie zarejestrowano", user: @user, protege: @user.protege, card: @user.protege.card}
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

  def user_exists_mobile
    @user = User.none
    if !params[:email].nil?
    @user = User.find_by(email: params[:email].downcase)
    end
    if @user.blank?
      render json: {status: "failure"}
    else
      render json: {status: "success", user: @user, protege: @user.protege, card: @user.protege.card}
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
                                   :password_confirmation, :login, :photo)
    end

    def user_mobile
      params.permit(:name, :surname, :email, :password, :password_confirmation, :login)
    end

end
