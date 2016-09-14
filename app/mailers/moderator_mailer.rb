class ModeratorMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email(user)
    mail(to: @user.email, subject: 'SERLER - New Paper Added ')
  end
end
