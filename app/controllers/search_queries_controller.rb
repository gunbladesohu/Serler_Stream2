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
    @search_query = SearchQuery.find(params[:id])
    @articles = do_search @search_query
    @search_query.allow_save = false
    # Load search line value
    @search_query.search_lines.each do |search_line|
      # get search field name from FieldTable
      field = FieldTable.find(search_line.field_id)
      search_line.search_field_txt = field.name
      # get join condition name
      j_condition = JoinCondition.find(search_line.join_condition)
      search_line.join_condition_txt = j_condition.name
      # get operator name
      o_operator = Operator.find(search_line.operator)
      search_line.opertator_txt = o_operator.name
      # get search value
      case search_line.field_id.to_i
        when 1
          search_line.value = DevMethod.find(search_line.value_id).name
        when 2
          search_line.value = Methodology.find(search_line.value_id).name
        when 3
          search_line.value = ResearchMethod.find(search_line.value_id).name
        when 4
          search_line.value = ResearchParticipant.find(search_line.value_id).name
        when 5,6,7,8,9,12,13,14
          search_line.value = search_line.value_text
        when 10,11
          search_line.value = search_line.value_number
      end
    end
    respond_to do |format|
      format.html { render :index }
    end
  end

  # GET /search_queries/queries_list
  def queries_list
    # List all current active queries
    @search_queries = SearchQuery.where isActive: true
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
    # @articles.each do |article|
    #   puts article.title
    # end
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

    # temporary save search query to database
    @search_query = SearchQuery.new(from_date: from_date, to_date: to_date, isActive: false)
    search_lines_attrs.each do |key, array|
      if array[:_destroy] == "false"
        join_condition = array[:join_condition].to_i
        field_id = array[:field_id]
        operator = array[:operator].to_i
        value_id = array[:value_id]
        value_text = array[:value_text].strip
        value_number = array[:value_number]
        search_line = SearchLine.new(join_condition: join_condition, field_id: field_id, operator: operator, value_id: value_id, value_text: value_text, value_number: value_number)
        # get search field name from FieldTable
        field = FieldTable.find(field_id)
        search_line.search_field_txt = field.name
        # get join condition name
        j_condition = JoinCondition.find(join_condition)
        search_line.join_condition_txt = j_condition.name
        # get operator name
        o_operator = Operator.find(operator)
        search_line.opertator_txt = o_operator.name
        # get search value
        case field_id.to_i
          when 1
            search_line.value = DevMethod.find(value_id).name
          when 2
            search_line.value = Methodology.find(value_id).name
          when 3
            search_line.value = ResearchMethod.find(value_id).name
          when 4
            search_line.value = ResearchParticipant.find(value_id).name
          when 5,6,7,8,9,12,13,14
            search_line.value = array[:value_text].strip
          when 10,11
            search_line.value = array[:value_number]
        end

        @search_query.search_lines << search_line
      end
    end
    
    if @search_query.save
      @articles = do_search @search_query
      @search_query.allow_save = true
      respond_to do |format|
        format.html { render :index }
      end
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
        format.html { redirect_to '/search_queries/queries_list', notice: 'Search query was successfully saved.' }
        # format.json { render :show, status: :ok, location: @search_query }
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
      params.require(:search_query).permit(:from_date, :to_date, :description, :isActive)
    end

    # Do search
    def do_search(search_query)
      @articles = nil
      search_query.search_lines.each do |search_line|
        if @articles.nil?
          @articles = line_condition search_line, false
        else
          join_condition = search_line.join_condition.to_i
          case join_condition
            when 1
              @articles = @articles | (line_condition search_line, false)
            when 2
              @articles = @articles & (line_condition search_line, false)
            when 3
              @articles = @articles - (line_condition search_line, false)
            when 4
              @articles = @articles | (line_condition search_line, true)
          end
        end
      end
      # search articles by years
      @articles = @articles & Article.where(:year => search_query.from_date..search_query.to_date)
    end

    # Create single search line condition
    def line_condition(search_line, or_not)
      # field_table row id
      field_id = search_line.field_id
      # get field_table row in FieldTable
      field = FieldTable.find(field_id)
      # field to search for
      search_field = field.field
      # get operator
      operator = search_line.operator.to_i
      # value to search for
      search_value = ""
      case field_id.to_i
        when 1,2,3,4
          search_value = search_line.value_id
        when 5,6,7,8,9,12,13,14
          search_value = search_line.value_text.strip
        when 10,11
          search_value = search_line.value_number
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
