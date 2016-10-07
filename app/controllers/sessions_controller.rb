class SessionsController < ApplicationController
  def new
  end

  def create


    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password_digest == (params[:session][:password])
      log_in user
      redirect_to articles_path
    else
      # 创建一个错误消息
      render 'new'
    end
  end

end
