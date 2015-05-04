class ContactsController < ApplicationController
  before_filter :find_contact, only: %i{show edit update destroy}

  def index
    @contacts = Contact.all.sort_by(&:email)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_url
      flash[:success] = "Contact #{@contact.name} was successfully created!"
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
      flash[:success] = "Contact #{@contact.name} was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = "Contact #{@contact.name} was successfully deleted!"
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email )
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
