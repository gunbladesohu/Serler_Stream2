class TestController < ApplicationController

  layout false
  def index
    @id = params[:id]

  end
end
