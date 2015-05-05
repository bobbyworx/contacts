class GroupsController < ApplicationController
  before_filter :find_group, only: %i{show edit update destroy}

  def index
    @groups = current_user.groups.paginate(:page => params[:page])#.sort_by(&:name)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    binding.pry
    if @group.save
      redirect_to root_url
      flash[:success] = "group #{@group.name} was successfully created!"
    else
      render :new
    end
  end

  def show
    render :edit
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
      flash[:success] = "group #{@group.name} was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:success] = "group #{@group.name} was successfully deleted!"
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, group_contacts_attributes: [:id, :first_name, :last_name, :email, :_destroy])
  end

  def find_group
    @group = Group.find(params[:id])
  end

end
