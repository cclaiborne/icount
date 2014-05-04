class ClientController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def new
    @client = Client.new
  end

  # def create
  #   @client = Client.new(client_params)
  #   if @client.save
  #     redirect_to new_client_report_path(@client)
  #   end
  # end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to new_client_report_path(@client), notice: 'Client was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


  def index
    @clients = Client.all
  end

  def show
  end

  def update
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :description)
  end

end
