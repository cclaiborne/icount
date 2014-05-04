class ClientController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to new_client_report_path(@client)
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
    params.permit(:name, :description)
  end

end
