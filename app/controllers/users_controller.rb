class UsersController < BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    # joins("LEFT JOIN student_enrollments ON courses.id = student_enrollments.course_id")
    # @users = User.joins(:users_roles,:roles)
    @users = User.joins("LEFT JOIN users_roles on users.id = users_roles.user_id LEFT JOIN roles on users_roles.role_id = roles.id")
    .select("users.id, users.first_name, users.last_name, roles.name ")
    .where("users_roles.is_active = true and roles.is_active = true")
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(
      :first_name => params[:firstName],
      :middle_name => params[:middleName],
      :last_name => params[:lastName],
      :email => params[:email],
      :dob => params[:dob],
      :gender => params[:gender],
      :password_digest => params[:password],
      :affiliation => params[:affiliation],
      :is_active => false)
    

    respond_to do |format|
      if @user.save
        format.html { redirect_to controller: 'users', action: 'new_user_confirmation', id: @user.id}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_user_confirmation
      id =  params[:id]
      
    host = request.host + "/users/new_user_email_confirmation/" + id
    
    @user = User.find(id)
      
    @subject = "Serler new user"
      
    @message = "<p>Thank you so much for joining Serler</p>
                  <p>Please click the below link to activate your account</p>
                  <a href='#{host}'>#{host}</a>
                   <p>Thank you so much for your time</p>
                   ".html_safe
                   
     HubMailer.moderator_confirmation_email(@user, @subject, @message).deliver_now  
     
     @windowMessage =  "<h3>Thank you for registering with Serler</h3>
                  <h3>There is an email sent you your email address. Please click the confirmation button in your email to activate your account</h3>".html_safe
  end
  
  
  def new_user_email_confirmation
    id =  params[:id]
      
    @user = User.find(id)
    
    @user.is_active = true
    
   respond_to do |format|
      if @user.save
        format.html { redirect_to controller: 'sessions', action: 'new', firstName: @user.first_name, lastName: @user.last_name, email: @user.email }
        # format.html { redirect_to root_url }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end


  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params (firstName)
    # params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :gender, :dob, :affiliation, :password, :password_confirmation)
     params.require(:user).permit(:first_name, :last_name, :email, :gender, :dob, :password)
  end
  
  
end
