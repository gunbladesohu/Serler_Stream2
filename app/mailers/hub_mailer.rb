class HubMailer < ApplicationMailer
  #testing
  layout 'welcome_email'
  def welcome_email(email, name, message)
    
    @name = name
    @message = message
    # @url  = 'http://example.com/login'
    attachments.inline['SerlerLogo_Black.png'] = File.read(Rails.root.join('app/assets/images/SerlerLogo_Black.png'))
    mail(to: email, subject: 'Welcome to Serler') do |format|
      format.html { render layout: 'welcome_email' }
    end
  end
  
  
  def moderator_confirmation_email(user, subject, message)
    
    @fullName = user.first_name + " " + user.last_name
    @message = message
    
    # Add logo
    attachments.inline['SerlerLogo_Black.png'] = File.read(Rails.root.join('app/assets/images/SerlerLogo_Black.png'))
    mail(to: user.email, subject: subject) do |format|
      format.html { render layout: 'moderator_confirmation_email' }
    end
  end


  
  def new_article_email(article_id)

    article_name = Article.find(article_id)
    @article_title = article_name.title

    # Get Moderator id from the DB
    mod_id = Role.find_by name: 'Moderator'

    @moderator_email = User.joins(:users_roles).select("users.email as mod_email").where("users_roles.role_id = #{mod_id.id}")
    #@moderator_email = @moderator_email1.mod_email

    # Add logo

    save2 = "s.anmoldeep1993@gmail.com"
    @moderator_email.each do |mod|

      save  = mod.mod_email + "," + save2
      save2 = save

    end


      @article_list_today = Article.where("created_at >= ?", Time.zone.now.beginning_of_day)
    attachments.inline['SerlerLogo_Black.png'] = File.read(Rails.root.join('app/assets/images/SerlerLogo_Black.png'))
    mail(to: save2, subject: 'New Article Submitted') do |format|
        format.html { render layout: 'new_article_email' }
      end

  end

  def article_av_for_analysis_email(subject2, message2)
@message2 = message2
    # Get Moderator id from the DB
    mod_id = Role.find_by name: 'Analyst'

    @moderator_email = User.joins(:users_roles).select("users.email as mod_email").where("users_roles.role_id = #{mod_id.id}")
    #@moderator_email = @moderator_email1.mod_email

    # Add logo

    save2 = "s.anmoldeep1993@gmail.com"
    @moderator_email.each do |mod|

      save  = mod.mod_email + "," + save2
      save2 = save

    end


    @article_list_today = Article.where("created_at >= ?", Time.zone.now.beginning_of_day)
    attachments.inline['SerlerLogo_Black.png'] = File.read(Rails.root.join('app/assets/images/SerlerLogo_Black.png'))
    mail(to: save2, subject: subject2) do |format|
      format.html { render layout: 'article_av_for_analysis' }
    end

  end

end