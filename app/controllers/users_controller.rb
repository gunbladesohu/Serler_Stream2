class UsersController < BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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
    
    @user = User.new(params[:user])
    
    # @user = User.new(
    #   :first_name => params[:firstName],
    #   :middle_name => params[:middleName],
    #   :last_name => params[:lastName],
    #   :email => params[:email],
    #   :dob => params[:dob],
    #   :gender => params[:gender],
    #   :password_digest => params[:password],
    #   :affiliation => params[:affiliation],
    #   :is_active => false)
    
    # @user.save
    
    # @user = User.new
    
    # @user.first_name = params[:firstName]
    # @user.middle_name = params[:middleName]
    # @user.last_name = params[:lastName]
    # @user.email = params[:email]
    # @user.dob = params[:dob]
    # @user.gender = params[:gender]
    # @user.password = params[:password]
    # @user.affiliation = params[:affiliation]
    # @user.is_active = false
    
    # @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
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

  # POST /users
  # POST /users.json
  #def login
  #   @user = User.find_by_email(params[:session][:email])
  #   if @user && @user.authenticate(params[:session][:password])
  #   else
  #     render 'new'
  #   end
  # end
  
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
