class ModeratorMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def new_article(article)
    @article = article
    mail(to: 'moderator@example.com', subject: 'SERLER - New Paper Added ')
  end
end
