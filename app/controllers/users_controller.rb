class UsersController < ApplicationController
  skip_before_filter :login_required
  before_filter :find_user, only: %i{show edit update destroy}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to contacts_path
      flash[:success] = "User #{@user.name} was successfully updated!"
    else
      render :edit
    end
  end

protected
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(session[:current_user_id])
  end
end
