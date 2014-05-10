require 'byebug'
class ReportController < ApplicationController
  before_filter :load_client

  def new
    #@client = Client.find(params[:client_id])
    @report = Report.new
  end

  def create
    #@client = Client.find(params[:client_id])
    @report = @client.reports.new(report_params)
    respond_to do |format|
      if @report.save
        #format.html { redirect_to client_report_path[@client, @report], notice: 'Report was successfully created.' }
        format.html { redirect_to client_path(@client), notice: 'Report was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  # def create
  #   @client = Client.find(params[:client_id])
  #   @report = Report.new(report_params)
  #   @report.save
  #   redirect_to root_path
  # end

  def index
    #@client = Client.find(params[:client_id])
    @reports = @client.reports.all
  end

  def show
  end

  def update
  end

  def destroy
    @client_reports = Report.find(params[:id])
    @client_reports.destroy
    respond_to do |format|
      format.html { redirect_to client_path(@client) }
      #format.json { head :no_content }
    end
  end

  protected

  def report_params
    params.require(:report).permit(:location, :client_id, :livingcondition, :gender, :ethnicity, :age, :needs, :notes)
  end

  def load_client
    @client = Client.find(params[:client_id])
  end



end

