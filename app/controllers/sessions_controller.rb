class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
    if current_user
      redirect_to root_url, notice: 'You are already signed in'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in successfully."
    else
      user = User.new
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to new_session_url, alert: "Signed out."
  end

end
