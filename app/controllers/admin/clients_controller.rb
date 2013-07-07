class Admin::ClientsController < ApplicationController
  respond_to :html
  before_filter :get_client, :except => [:index, :create]

  def index
    @clients = Client.all
  end

  def show
    @client
  end

  def new
  end

  def edit
  end

  def create
    @client = Client.new(@clientParams)
    if @client.save
      redirect_to admin_clients_path, :notice => "Created..."
    else
      flash[:alert] = "Error"
      render :action => "new"
    end
  end

  def update
    if @client.update_attributes(@clientParams)
      redirect_to admin_clients_path, :notice => "Updated ..." 
    else
      flash[:alert] = "Error"
      render :action => "edit"
    end
  end

  def destroy
    if @client.destroy
      redirect_to admin_clients_path, :notice => "Destroyed ..."
    else
      flash[:alert] = "Error"
      render :action => "edit"
    end
  end

  private
    def get_client
      @client = params[:id].present? ? Client.find(params[:id]) : Client.new
      @clientParams = params[:client].present? ? params[:client].permit(:name, :email, :contact) : []
    end

end
