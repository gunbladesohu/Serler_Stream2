class ModeratorMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def new_article(article)
    @article = article
    mail(to: 's.anmoldeep1993@gmail.com', subject: 'SERLER - New Paper Added ')
  end
end
