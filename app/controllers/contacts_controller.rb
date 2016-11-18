class ContactsController < ApplicationController

  def contacts

    @contacts = Contact.all

  end

  def new_contact
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio])
    @contact.save
  end

  def create_contact
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.assign_attributes(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio])
    contact.save

    redirect_to "/contacts/#{contact.id}"

  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy

    redirect_to "/contacts"

  end

end
