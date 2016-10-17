class AdminController  < BaseController
# layout false

  def mail_test
    
  end
  
  def mail_send
    @message = "<p>Testing MSG</p>".html_safe
    
    HubMailer.welcome_email(params[:email], params[:name], @message).deliver_now 
    
  end
  
  def article_view
     type = params[:id]
     
    if current_user.nil?
      redirect_to root_url
    else
      if type == "Moderator"
        @ArticleList = Article.joins(:article_type,:status)
        .select("articles.id as article_id, articles.title as article_title, 
                article_types.name as type_name, articles.updated_at as updated_time, 
                statuses.name as status_name, articles.journal as journal
                , articles.year as year, articles.volume as volume
                , articles.number as number, articles.month as month
                , articles.pages as pages, articles.isbn as isbn
                , articles.doi as doi, articles.url as url
                , articles.keyword as keyword, articles.abstract as abstract")
        .where("article_types.is_active = true and articles.is_active = false and statuses.name = 'To be moderated'")
        
      else
        
      end
    end
  end
  
  def article_view_moderator
    
    id = current_user.id
    
    @ArticleList = Article.joins(:article_type,:status)
      .select("articles.id as article_id, articles.title as article_title, 
              article_types.name as type_name, articles.updated_at as updated_time, 
              statuses.name as status_name, articles.journal as journal
              , articles.year as year, articles.volume as volume
              , articles.number as number, articles.month as month
              , articles.pages as pages, articles.isbn as isbn
              , articles.doi as doi, articles.url as url
              , articles.keyword as keyword, articles.abstract as abstract")
      .where("article_types.is_active = true and articles.is_active = false and statuses.name = 'Moderator picked up' and articles.admin_id = #{id}")
    #
  end
  
  def article_moderator_picked_up
    
    id = params[:id]
    list = params[:list].split(",").map { |s| s.to_i }
    
    status = Status.find_by name: "Moderator picked up"
    
    list.each do |l|
      articleItem = Article.find(l)
      articleItem.admin_id = id
      articleItem.status_id = status.id
      articleItem.save
    end
    
    redirect_to article_view_moderator_path
  end
  
  def article_quality_check
    
     articleItem = Article.find(params[:articleId])
    
    if params[:isAccepted] 
      @statusId = Status.find_by name: "Accepted"
      
      articleItem.status = @statusId
      articleItem.is_active = true
      
      @user = User.find(articleItem.user_id)
      
      @subject = "Congratulations"
      
       @message = "<p><b>Congratulations!</b></p>
                  <p>We are informed that the following article has been accepted by Serler:</p>
                  <p><i>#{articleItem.title}</i></p>
                   <p>Thank you so much for using Serler</p>
                   ".html_safe

      @message2 = "<p><b>Greetings for the day!!</b></p>
                  <p>We are informed that the following article is available for Analysis on Serler:</p>
                  <p><i>#{articleItem.title}</i></p>
                   ".html_safe
      @subject2 = "New Article available for Analysis"

      HubMailer.moderator_confirmation_email(@user, @subject, @message).deliver_now
      HubMailer.article_av_for_analysis_email(@subject2, @message2).deliver_now

       @windowMessage =  "<h1>Acceptance email sent</h1>
                  <h3>An acceptance email has sent to #{@user.first_name} #{@user.last_name} at #{@user.email}</h3>".html_safe
    else
      
      @statusId = Status.find_by name: "Rejected"
      articleItem.status = @statusId
      
      @user = User.find(articleItem.user_id)
      
      @subject = "Article rejected"
      
      @message = "<p>Thank you very much for your interesting articles</p>
                  <p>However, we are sorry that the following article has been rejected by Serler:</p>
                  <p><i>#{articleItem.title}</i></p>
                  <p>Please review the following rejection reasons:</p>
                  <ul>".html_safe + 
                  (articleItem.peer_reviewed == false ? "<li>The article has not been peer reviewed yet</li>".html_safe : "".html_safe) +
                  (articleItem.relevance == false ? "<li>The article is not relevant</li>".html_safe : "".html_safe) +
                  (articleItem.not_duplicate == false ? "<li>The article is duplicate</li>".html_safe : "".html_safe) +
                  "</ul>
                  <p>Please double check your article again and contact us if you have any questions</p>
                   ".html_safe
       
      HubMailer.moderator_confirmation_email(@user, @subject, @message).deliver_now 
      
      @windowMessage =  "<h1>Rejection email sent</h1>
                  <h3>A rejection email has sent to #{@user.first_name} #{@user.last_name} at #{@user.email}</h3>".html_safe
    end
    
    #articleItem.updated_at = DateTime.now
    articleItem.save
    # redirect_to :action => :article_view
  end
  
  def article_detail
    @article = Article.joins(:article_type,:status)
    .select("articles.peer_reviewed ", "articles.relevance ", "articles.not_duplicate")
    .where("article_types.is_active = true", "articles.is_active = flase", "statuses.is_active = true").find(params[:articleId])
      
    respond_to do |format|
      format.json { render json: {values: @article, operators: @operators} }
    end
  end
  
  def criteria_change
    articleItem = Article.find(params[:articleId])
    articleItem.peer_reviewed = params[:peer_reviewed]
    articleItem.relevance = params[:relevance]
    articleItem.not_duplicate = params[:not_duplicate]
    articleItem.save
  end
  
  
  def article_show
    #render :action => :article_view
    redirect_to :action => :article_view
  end

  def add_dev_method
    @ArticleList = Article.joins(:article_type,:status)
                       .select("articles.id as article_id, articles.title as article_title,
            article_types.name as type_name, articles.updated_at as updated_time,
            statuses.name as status_name, articles.journal as journal
            , articles.year as year, articles.volume as volume
            , articles.number as number, articles.month as month
            , articles.pages as pages, articles.isbn as isbn
            , articles.doi as doi, articles.url as url
            , articles.keyword as keyword, articles.abstract as abstract")
                       .where("article_types.is_active = true and articles.is_active = true")

    #NewArticleDevMethod = articles_dev_method.new(:article_id => , :dev_method_id=> )
    #NewArticleDevMethod.save

  end

  def add_dev_method_page
    @articleid = Article.find(params[:articleid])
    @ArticleList = Article.joins(:article_type,:status)
                       .select("articles.id as article_id, articles.title as article_title,
            article_types.name as type_name, articles.updated_at as updated_time,
            statuses.name as status_name, articles.journal as journal
            , articles.year as year, articles.volume as volume
            , articles.number as number, articles.month as month
            , articles.pages as pages, articles.isbn as isbn
            , articles.doi as doi, articles.url as url
            , articles.keyword as keyword, articles.abstract as abstract")
                       .where("article_types.is_active = true and articles.is_active = true and articles.id = ?",params[:articleid])
  end

  #adds a record to the methodology table and adds a relation to articles methodology table

  def update_methodology

    @name = params[:name]
    @description = params[:description]
    @articleid = params[:articleid]
    # create a record in the methodology  table and add a relation in articles methodology table.
    @m = Methodology.create(:name=> @name, :description=> @description)
    @last_record_save_id=Methodology.last.id
    @am = ArticlesMethodology.create(:article_id => @articleid,:methodology_id => @last_record_save_id,:is_active => true)

  end

   # GET /admin/exsitedEmailCheck
  def exsitedEmailCheck
    @user = User.where("lower(email) =?", params[:email].downcase).first
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @user}
    end
  end

  def new_user

  end
  
  def user_management
    
   if current_user.nil?
      redirect_to root_url
   else
     if current_user_role.nil?
       redirect_to root_url
     else
       if current_user_role.name.include? "Admin"
         
       else
         redirect_to root_url
       end
     end
   end
   
  end
  
  def getUserList
    @UserList = User.joins("LEFT JOIN users_roles on users.id = users_roles.user_id LEFT JOIN roles on users_roles.role_id = roles.id")
    .select("users.id, users.first_name,users.middle_name, users.last_name, users.email, users.gender, users.dob, users.affiliation, users.password_digest,
    string_agg(distinct(roles.name), ', ' order by roles.name) as role_name ")
    .where("users_roles.is_active = true and roles.is_active = true and users.is_active = true")
    .group("users.id, users.first_name,users.middle_name, users.last_name, users.email, users.gender, users.dob, users.affiliation, users.password_digest")
     
     render :json => @UserList                  
  end
  
  
  
  def updateUser
    selectedRolesId = params[:selectedRolesId].split(",").map { |s| s.to_i }
    userId = params[:userId]
   
    userRole = Role.find_by name: "User"
    user_role_list = UsersRole.all.where("users_roles.user_id=#{userId} and users_roles.role_id != #{userRole.id}")
    
    user_role_list.each do |variable|
        variable.is_active = false
        variable.save 
    end
      
   
    
   if selectedRolesId.size > 0
     
      selectedRolesId.each do |id|
        
        item = UsersRole.all.where("users_roles.user_id = #{userId} and users_roles.role_id = #{id}").first
        
        if item.nil?
          
          @newItem = UsersRole.create(:user_id => userId, :role_id => id, :is_active => true)
          @newItem.save
        else
          
          
          item.is_active = true
          item.save
        end
      end
   end
    
  
    render :json => true  
    
  end
  
  def getRoles
    @roles = Role.all.where("roles.is_active = true and roles.name != 'User'")
    
    render :json => @roles  
  end
  
  
  def feedback
     
  end
  
  def add_feedback
     message = params[:message]
    
    @newItem = Feedback.create(
      :user_id => current_user.id, 
      # :article_id => 0, 
      :description => message, 
      :is_active => true)
      
    respond_to do |format|
      if @newItem.save
        format.html { redirect_to admin_add_feedback_confirmation_path}
        # format.json { render :show, status: :created, location: @feedback }
      end
    end
    
  end
  
  def add_feedback_confirmation
    
  end
  
end