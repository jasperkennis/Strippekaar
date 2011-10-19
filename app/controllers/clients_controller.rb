class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(params[:client])
    
    if @client.save
      redirect_to @client,
        :notice => "Client has been created"
    else
       render :action => "new"
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to root_path,
      :notice => "Client has been destroyed"
  end

end
