class SearchQueriesController < BaseController
  before_action :set_search_query, only: [:show, :edit, :update, :destroy]

  # GET /search_queries
  # GET /search_queries.json
  def index
    # if @search_queries.nil?
    #   @articles = Article.all
    # end
    @articles = Article.search(params[:search])
  end

  # GET /search_queries/1
  # GET /search_queries/1.json
  def show
  end

  # GET /search_queries/new
  def new
    @search_query = SearchQuery.new
    @search_query.search_lines << SearchLine.new
    @search_fields = FieldTable.all
    @search_field_values = Array.new
    @join_conditions = JoinCondition.all
    @operators = Operator.all
  end

  # GET /search_queries/1/edit
  def edit
  end

  # POST /search_queries
  # POST /search_queries.json
  def create
    search_lines_attrs = params[:search_query][:search_lines_attributes]
    @articles = nil
    search_lines_attrs.each do |key, array|
      if @articles.nil?
        @articles = line_condition array
      else
        @articles = @articles & (line_condition array)
      end
    end

    respond_to do |format|
      format.html { render :index }
    end

    # @search_query = SearchQuery.new(search_query_params)
    #
    # respond_to do |format|
    #   if @search_query.save
    #     format.html { redirect_to @search_query, notice: 'Search query was successfully created.' }
    #     format.json { render :show, status: :created, location: @search_query }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @search_query.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /search_queries/1
  # PATCH/PUT /search_queries/1.json
  def update
    respond_to do |format|
      if @search_query.update(search_query_params)
        format.html { redirect_to @search_query, notice: 'Search query was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_query }
      else
        format.html { render :edit }
        format.json { render json: @search_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_queries/1
  # DELETE /search_queries/1.json
  def destroy
    @search_query.destroy
    respond_to do |format|
      format.html { redirect_to search_queries_url, notice: 'Search query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Update value fields
  def update_values
    field = FieldTable.find(params[:field_id])

    case params[:field_id].to_i
      when 1,2,3,4
        @operators = Operator.where(value: 4)
      when 5,6,7,8,9,12,13,14
        @operators = Operator.where(value: [0,1,2,3])
      when 10,11
        @operators = Operator.where(value: [4,5,6,7,8])
    end

    model_name = field.model
    model = Object.const_get model_name
    @field_values = model.all
    respond_to do |format|
      format.json { render json: {values: @field_values, operators: @operators} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_query
      @search_query = SearchQuery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_query_params
      params.fetch(:search_query, {})
    end

  # Create single search line condition
  def line_condition(array)
    tables = Array.new
    field_id = array[:field_id] # field_table row id
    field = FieldTable.find(field_id) # get field_table row in FieldTable
    tables.push(field.table)
    search_field = field.field # field to search for
    operator = 4
    search_value = array[:id] # value to search for - fix value
    model_name = field.model
    model = Object.const_get model_name

    con = model.search_by search_field, operator, search_value

    return (Article.joins(*tables.map(&:to_sym)).where con).uniq
  end
end
