class SessionsController < ApplicationController

  include SessionsHelper
  
  def new
    
    firstName = params[:firstName]
    lastName = params[:lastName]
    email = params[:email]
    condition = User.exists?(['email =?', email])
    
    if  condition == true
     
      user = User.where("email =?", email).first
      
      log_in user
      
    else
          user = User.new(
            :first_name => firstName,
            :middle_name => "",
            :last_name => lastName,
            :email => email,
            :dob => "",
            :gender => "",
            :password_digest => "samplepassword123",
            :affiliation => "",
            :is_active => true)
      
          user.save
          
          log_in user
          
    end
    
   redirect_to root_url 

  end



  def create
    
    # user = User.find_by(email: params[:session][:email].downcase)
    user = User.find_by(email: params[:session][:email].downcase, password_digest: params[:session][:password])
    # if user && user.authenticate(params[:session][:password])
    if user
      # Log the user in and redirect to the user's show page.
      log_in user

      redirect_to articles_path


    else
      # Create an error message.
      flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end

  end
  
  def destroy
    log_out
    redirect_to root_url
  end

end
