class Admin::ProjectsController < ApplicationController
  respond_to :html
  before_filter :get_project, :except => [:index,:create]

  def index
      @projects = Project.all
      
  end

  def show
    @project
  end

  def new

  end

  def edit

  end

  def create
      @project = Project.new(@projectParams)
      if @project.save
        redirect_to admin_projects_path, :notice => "Created ..."
      else
        flash[:alert] = "Error"
        render :action => 'new'
      end
  end

  def update
      if @project.update_attributes(@projectParams)
        redirect_to admin_projects_path, :notice => "Updated ..."
      else
        flash[:alert] = "Error"
        render :action => 'edit'
      end
  end

  def destroy
      
      if @project.destroy
        redirect_to admin_projects_path, :notice => "Destroyed ..."
      else
        flash[:alert] = "Error"
        render :action => 'edit'
      end
  end

  private
    def get_project
      @project = params[:id].present? ? Project.find(params[:id]) : Project.new
      @projectParams = params[:project].present? ? params[:project].permit(:client_id, :name, :description, :budget) : []
    end

end
