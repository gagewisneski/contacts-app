class ContactsController < ApplicationController
  before_action :authenticate_user!

  def contacts

    @group = Group.find_by(name: params[:group])

    if params[:group]
      @contacts = @group.contacts
    else
      @contacts = Contact.all
    end

    if @group == nil
      @group = "Group"
    else
      @group = @group.name
    end

  end

  def new_contact
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], user_id: current_user.id)
    @contact.save
  end

  def create_contact
  end

  def show
    @contact = Contact.find_by(id: params[:id])

    if current_user.id != @contact.user_id
      redirect_to "/contacts"
    end
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
