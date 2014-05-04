require 'byebug'
class ReportController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
    @report = Report.new
  end

  def create
    @client = Client.find(params[:client_id])
    @report = Report.new(report_params)
    @report.save
    redirect_to root_path
  end

  def index
  end

  def show
  end

  def update
  end

  protected

  def report_params
    params.permit(:location, :client_id => @client.id)
  end

end

