class ContactsController < ApplicationController

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

     if @contact.save
       redirect_to root_path
       name = params[:contact][:name]
       email = params[:contact][:email]
       message = params[:contact][:message]
       supplier = params[:contact][:supplier]
       registered_user = params[:contact][:registered_user]

       ContactMailer.contact_email(name, email, message, supplier, registered_user).deliver
       flash[:success] = 'Thanks for the message, we will be in touch soon.'
     else
       redirect_to pages_contact_path
       flash[:danger] = 'Opps, there was a problem! Please fill out all the fields.'
     end
   end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message, :registered_user, :supplier)
    end
end
