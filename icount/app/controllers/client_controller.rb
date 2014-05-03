class ClientController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to main_index_path
    else 
      render :action => :new
    end
  end

  def index
  end

  def show
  end

  def update
  end

  protected
  
  def client_params
    params.require(:client).permit(:name, :description)
  end

end
