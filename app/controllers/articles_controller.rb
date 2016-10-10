class ArticlesController < BaseController

#layout false

  before_action :logged_in?
  before_action :current_user
  before_action :current_user_role
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.all
    if @current_user_role.name == "Admin"
      @articles = Article.includes(:users).all
    else
      @articles = Article.includes(:users)
      .user_filter(@current_user.id)
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    set_article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @articles = Article.includes(:research_participants, :research_methods, :dev_methods, :methodologies)
    #@research_questions = ResearchQuestion.all
    #@research_metrics = ResearchMetric.all
    @research_participants = ResearchParticipant.all
    @research_methods = ResearchMethod.all
    @dev_methods = DevMethod.all
    @methodologies = Methodology.all
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article }
        format.json { render :show, status: :created, location: @article }
        @article_id=Article.last.id

        # tell the moderator mailer to send an email
       HubMailer.new_article_email(@article_id).deliver_now

      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      if current_user.nil?
        redirect_to login_url
      end
    end

    def current_user_role
       @current_user_role ||= User.joins("LEFT JOIN users_roles on users.id = users_roles.user_id LEFT JOIN roles on users_roles.role_id = roles.id")
      .select("roles.name ")
      .where("users_roles.is_active = true and roles.is_active = true and users.id=#{session[:user_id]}").first

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :journal, :year, :volume, :type_id,
        :number, :month, :research_questions, :research_metrics, :pages, :isbn, :doi, :url, :keyword, :abstract,
        #research_participants_attributes: [:name],
        #research_methods_attributes: [:name, :id]
        { research_method_ids: []},
        { research_participant_ids: []},
        { dev_method_ids: []},
        { methodology_ids: []},
        { status_ids: []}
        )
    end
  end
