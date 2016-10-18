class LogsAdminController < ApplicationController

  before_action :set_logs_admin, only: [:show]

  def index
    @logs_admin = LogsAdmin.all
  end

  def show
  end

  def new
    @logs_admin = LogsAdmin.new
  end


  def edit
  end


  def create
    @logs_admin = LogsAdmin.new(logs_admin_params)

    respond_to do |format|
      if @logs_admin.save
        printf("logs created")
      else
        printf("logs create error")
      end
    end
  end


  def update
  end


  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_logs_admin
    @logs_admin = LogsAdmin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def logs_admin_params
    params.require(:logs_admin).permit(:id)
  end
end
