class ContactsController < ApplicationController

  #The new action allows
  def new
    @contact = Contact.new
  end

  #The create action allows the user to send the contact form.
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
