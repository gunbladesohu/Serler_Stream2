class AdminController  < BaseController
  def article_view
    @ArticleList = Article.joins(:article_type,:status)
    .select("articles.id as article_id, articles.title as article_title, 
            article_types.name as type_name, articles.updated_at as updated_time, 
            statuses.name as status_name, articles.journal as journal
            , articles.year as year, articles.volume as volume
            , articles.number as number, articles.month as month
            , articles.pages as pages, articles.isbn as isbn
            , articles.doi as doi, articles.url as url
            , articles.keyword as keyword, articles.abstract as abstract")
    .where("article_types.is_active = true and articles.is_active = false")
    
  end
  
  def article_quality_check
    
    articleItem = Article.find(params[:articleId])
    
    
    if params[:isAccepted] 
      articleItem.status_id = 2
      articleItem.is_active = true
    else
      articleItem.status_id = 3
    end
    
    #articleItem.updated_at = DateTime.now
     articleItem.save
    redirect_to :action => :article_view
  end
  
  def article_detail
    @article = Article.joins(:article_type,:status)
    .select("articles.id as article_id, articles.title as article_title, article_types.name as type_name, articles.updated_at as updated_time, statuses.name as status_name")
    .where("article_types.is_active = true", "articles.is_active = true", "statuses.is_active = true").find(params[:articleId])
      
    respond_to do |format|
      format.json { render json: {values: @article, operators: @operators} }
    end
  end
  
  def article_show
    #render :action => :article_view
    redirect_to :action => :article_view
  end
end
