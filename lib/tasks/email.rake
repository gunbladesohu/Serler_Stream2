task :send_daily_mail => :environment do


  @article_id=Article.last.id

  # tell the moderator mailer to send an email
  HubMailer.new_article_email(@article_id).deliver_now
end

