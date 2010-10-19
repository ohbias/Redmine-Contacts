class ContactsController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
    @contacts = Contact.find(:all)
  end
  
  def details
    #@contacts = Contact.find(:all)
    @project = Project.find(params[:project_id])
    @contact = Contact.find_by_id(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @contact = Contact.new
  end

  def create
    @project = Project.find(params[:project_id])
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Contact added."
      redirect_to :action => 'index', :project_id => @project
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @contact = Contact.find_by_id(params[:id])
    if @contact.destroy
      flash[:notice] = l(:notice_successful_delete)
    else
      flash[:error] = l(:notice_unsuccessful_save)
    end
    redirect_to :action => "index", :project_id => @project
  end

  def edit
    @project = Project.find(params[:project_id])
    @contact = Contact.find_by_id(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @contact = Contact.find_by_id(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :action => "details", :id => params[:id], :project_id => @project
    else
      flash[:notice] = l(:notice_unsuccessful_update)
      render :action => "edit", :id => params[:id], :project_id => @project
    end
  end
end
