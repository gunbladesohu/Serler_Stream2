class SearchQueriesController < BaseController
  before_action :set_search_query, only: [:show, :edit, :update, :destroy]

  # GET /search_queries
  # GET /search_queries.json
  def index
    if params[:quick_search].nil? || params[:quick_search].blank?
      @articles = Array.new
    else
      @articles = Article.search(params[:quick_search].strip)
    end
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
    @join_conditions = JoinCondition.all

    # Set default view options
    field = 1 # Default field selected
    operator_field_value field
  end

  def browse_repository
    @articles = Article.all
  end

  # GET /search_queries/1/edit
  def edit
  end

  # POST /search_queries
  # POST /search_queries.json
  def create
    search_lines_attrs = params[:search_query][:search_lines_attributes]
    from_date = params[:search_query][:from_date]
    to_date = params[:search_query][:to_date]

    # Check year
    if to_date.blank?
      to_date = Time.now.year
    end

    if from_date.blank?
      from_date = 0
    end

    puts from_date
    puts to_date

    @articles = nil
    search_lines_attrs.each do |key, array|
      if array[:_destroy] == "false"
        if @articles.nil?
          @articles = line_condition array, false
        else
          join_condition = array[:join_condition].to_i
          case join_condition
            when 1
              @articles = @articles | (line_condition array, false)
            when 2
              @articles = @articles & (line_condition array, false)
            when 3
              @articles = @articles - (line_condition array, false)
            when 4
              @articles = @articles | (line_condition array, true)
          end
        end
      end
    end

    # search articles by years
    @articles = @articles & Article.where(:year => from_date..to_date)

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
    operator_field_value params[:field_id].to_i

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
      # params.fetch(:search_query, {})
      params.require(:search_query).permit(:from_date, :to_date, :descrtiption)
    end

    # Create single search line condition
    def line_condition(array, or_not)
      # field_table row id
      field_id = array[:field_id]
      # get field_table row in FieldTable
      field = FieldTable.find(field_id)
      # field to search for
      search_field = field.field
      # get operator
      operator = array[:operator].to_i
      # value to search for
      search_value = ""
      case array[:field_id].to_i
        when 1,2,3,4
          search_value = array[:value_id]
        when 5,6,7,8,9,12,13,14
          search_value = array[:value_text].strip
        when 10,11
          search_value = array[:value_number]
      end
      model_name = field.model
      model = Object.const_get model_name

      con = model.search_by search_field, operator, search_value

      if field.table == "authors"
        con = model.search_by("first_name", operator, search_value).or model.search_by("middle_name", operator, search_value).or model.search_by("last_name", operator, search_value)
      end

      # Or not search
      if or_not
        if field.table == "articles"
          return Article.where.not con
        end

        tables = [field.table]
        return (Article.joins(*tables.map(&:to_sym)).where.not con).uniq
      end

      if field.table == "articles"
        return Article.where con
      end

      tables = [field.table]
      return (Article.joins(*tables.map(&:to_sym)).where con).uniq
    end

    # Get operator & field value
    def operator_field_value(field_id)
      field = FieldTable.find field_id

      # Operator value
      case field_id
        when 1,2,3,4
          @operators = Operator.where(value: 5)
        when 5,6,7,8,9,12,13,14
          @operators = Operator.where(value: [1,2,3,4])
        when 10,11
          @operators = Operator.where(value: [5,6,7,8,9])
      end

      # Field value
      model_name = field.model
      model = Object.const_get model_name
      @field_values = model.all
    end
end
