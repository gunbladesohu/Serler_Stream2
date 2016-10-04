desc "This task is called by the Heroku scheduler add-on"
task :send_email => :environment do

  @article_id=Article.last.id

  HubMailer.new_article_email(@article_id).deliver_now

end