class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
  end
  
  def new
    @client = Client.new
  end
  
  def create
    
    @client = Client.new(params[:client])
    
    if @client.save
      redirect_to @client,
                  :notice => "\"#{@client.name}\" has been created"
    else
       render :action => "new"
    end
  end

end
