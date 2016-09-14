# Preview all emails at http://localhost:3000/rails/mailers/moderator_mailer
class ModeratorMailerPreview < ActionMailer::Preview
  def moderator_mailer_preview
    ModeratorMailer.new_article(Article.first)
  end
end
