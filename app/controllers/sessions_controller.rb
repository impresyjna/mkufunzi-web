#Log out and login user.
class SessionsController < ApplicationController
  #Prepare data for login user.
  def new
  end

  #Login user.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated == true
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_path
      else
        flash.now[:danger] = 'Użytkownik nie jest aktywny'
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  #Log out user.
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end
