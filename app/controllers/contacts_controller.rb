class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    set_meta_tags(title: t('contact.title'))
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Unable to send message."
      render_action(:new)
    end

  end

end
