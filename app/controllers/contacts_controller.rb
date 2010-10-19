class ContactsController < ApplicationController
  unloadable

  def index
    @contacts = Contact.find(:all)
  end
  
  def details
    #@contacts = Contact.find(:all)
    @contact = Contact.find_by_id(params[:id])
  end

  def new
   @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Contact added."
      redirect_to :action => 'index'
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    if @contact.destroy
      flash[:notice] = l(:notice_successful_delete)
    else
      flash[:error] = l(:notice_unsuccessful_save)
    end
    redirect_to :action => "index"
  end

  def edit
    @contact = Contact.find_by_id(params[:id])
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :action => "details", :id => params[:id]
    else
      flash[:notice] = l(:notice_unsuccessful_update)
      render :action => "edit", :id => params[:id]
    end
  end
end
