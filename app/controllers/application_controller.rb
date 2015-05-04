class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login_required

  def access_denied
    if current_user
      head :forbidden
    else
      session[:return_to] = request.url
      redirect_to new_session_path
    end
  end

  def start_url
    root_url
  end

  def login_required
    access_denied unless current_user?
  end

  def current_user?
    current_user
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  helper_method :current_user, :current_user?
end
