class AnalystsController < ApplicationController
  before_action :set_analyst, only: [:show, :edit, :update, :destroy]

  def show
    @analyst = User.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyst
      @analyst = User.find(params[:id])
    end
end
