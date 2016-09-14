class ModeratorMailer < ApplicationMailer
  default from: 'xyz@example.com'

  def new_paper()
    mail(to: @user.email, subject: 'SERLER - New Paper Submission .')
  end


end
