class HubMailer < ApplicationMailer
  
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
end