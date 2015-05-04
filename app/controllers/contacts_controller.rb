class ContactsController < ApplicationController
  before_filter :find_contact, only: %i{show edit update destroy}

  def index
    @contacts = @contacts.all.sort_by(&:email)
  end

  def new
    @contact = contact.new
  end

  def create
    @contact = @contacts.new(contact_params)
    if @contact.save
      redirect_to root_url
      flash[:notice] = "contact #{@contact.name} was successfully added to #{@account.name}."
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
    if @contact.update(contact_params)
      redirect_to contacts_path
      flash[:notice] = "contact #{@contact.name} was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_path }
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email )
  end

  def find_contact
    @contact = @contact.find(params[:id])
  end
end
