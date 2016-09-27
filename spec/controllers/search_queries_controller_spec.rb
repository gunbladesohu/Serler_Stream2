require 'rails_helper'

RSpec.describe SearchQueriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SearchQuery. As you add validations to SearchQuery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:description=>"", :from_date=>"1990", :to_date=>"2016", :search_lines_attributes=>{:aaa=>{:join_condition=>"1", :field_id=>"1", :operator=>"5", :value_id=>"1", :value_text=>"a", :value_number=>"1", :_destroy=>"false"}, :bbb=>{:join_condition=>"1", :field_id=>"5", :operator=>"1", :value_id=>"1", :value_text=>"programming", :value_number=>"1", :_destroy=>"false"}}}
  }

  let(:invalid_attributes) {
    {:description=>"", :from_date=>"1990", :to_date=>"2016", :search_lines_attributes=>{:aaa=>{:join_condition=>"1", :field_id=>"1", :operator=>"5", :value_id=>"1", :value_text=>"", :value_number=>"1", :_destroy=>"false"}, :bbb=>{:join_condition=>"2", :field_id=>"6", :operator=>"1", :value_id=>"1", :value_text=>"kh", :value_number=>"1", :_destroy=>"false"}}}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SearchQueriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "found articles by quick search" do
      get :index, quick_search: "programming", session: valid_session
      expect(assigns(:articles).size).to be > 0
      expect(response).to render_template(:index)
    end

    it "not found articles" do
      get :index, quick_search: "pizza", session: valid_session
      expect(assigns(:articles).size).to eq(0)
      expect(response).to render_template(:index)
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested search_query as @search_query" do
  #     search_query = SearchQuery.create! valid_attributes
  #     get :show, params: {id: search_query}, session: valid_session
  #     expect(assigns(:search_query)).to eq(search_query)
  #   end
  # end

  describe "GET #new" do
    it "assigns a new search_query as @search_query" do
      get :new, params: {}, session: valid_session
      expect(assigns(:search_query)).to be_a_new(SearchQuery)
      expect(assigns(:search_fields).size).to be > 0
      expect(assigns(:join_conditions).size).to be > 0
      expect(response).to render_template(:new)
    end
  end

  # describe "GET #browse_repository" do
  #   it "assigns a new articles as @articles" do
  #     get :browse_repository, params: {}, session: valid_session
  #     # expect(assigns(:search_query)).to be_a_new(SearchQuery)
  #     @articles.should have(10).things
  #     # is_expected.to have(10).items
  #     # expect(assigns(:join_conditions).size).to be > 0
  #     # expect(response).to render_template(:new)
  #   end
  # end


  # describe "GET #edit" do
  #   it "assigns the requested search_query as @search_query" do
  #     search_query = SearchQuery.create! valid_attributes
  #     get :edit, params: {id: search_query.to_param}, session: valid_session
  #     expect(assigns(:search_query)).to eq(search_query)
  #   end
  # end

  describe "POST #create" do
    it "found articles" do
      expect {
        post :create, search_query: valid_attributes, session: valid_session
      }.to change(SearchQuery, :count).by(1)
      expect(assigns(:articles).size).to be > 0
      expect(response).to render_template(:index)
    end

    it "not found articles" do
      post :create, search_query: invalid_attributes, session: valid_session
      expect(assigns(:articles).size).to eq(0)
      expect(response).to render_template(:index)
    end

    # context "with valid params" do
    #   it "creates a new SearchQuery" do
    #     expect {
    #       post :create, params: {search_query: valid_attributes}, session: valid_session
    #     }.to change(SearchQuery, :count).by(1)
    #   end
    #
    #   it "assigns a newly created search_query as @search_query" do
    #     post :create, params: {search_query: valid_attributes}, session: valid_session
    #     expect(assigns(:search_query)).to be_a(SearchQuery)
    #     expect(assigns(:search_query)).to be_persisted
    #   end
    #
    #   it "redirects to the created search_query" do
    #     post :create, params: {search_query: valid_attributes}, session: valid_session
    #     expect(response).to redirect_to(SearchQuery.last)
    #   end
    # end
    #
    # context "with invalid params" do
    #   it "assigns a newly created but unsaved search_query as @search_query" do
    #     post :create, params: {search_query: invalid_attributes}, session: valid_session
    #     expect(assigns(:search_query)).to be_a_new(SearchQuery)
    #   end
    #
    #   it "re-renders the 'new' template" do
    #     post :create, params: {search_query: invalid_attributes}, session: valid_session
    #     expect(response).to render_template("new")
    #   end
    # end
  end

  # describe "GET #update_values" do
  #   it "ajax get when update field" do
  #     # get :update_values, field_id: 2, session: valid_session
  #     xhr :get, :update_values, field_id: 2, :format => "json"
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested search_query" do
  #       search_query = SearchQuery.create! valid_attributes
  #       put :update, params: {id: search_query.to_param, search_query: new_attributes}, session: valid_session
  #       search_query.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested search_query as @search_query" do
  #       search_query = SearchQuery.create! valid_attributes
  #       put :update, params: {id: search_query.to_param, search_query: valid_attributes}, session: valid_session
  #       expect(assigns(:search_query)).to eq(search_query)
  #     end
  #
  #     it "redirects to the search_query" do
  #       search_query = SearchQuery.create! valid_attributes
  #       put :update, params: {id: search_query.to_param, search_query: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(search_query)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the search_query as @search_query" do
  #       search_query = SearchQuery.create! valid_attributes
  #       put :update, params: {id: search_query.to_param, search_query: invalid_attributes}, session: valid_session
  #       expect(assigns(:search_query)).to eq(search_query)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       search_query = SearchQuery.create! valid_attributes
  #       put :update, params: {id: search_query.to_param, search_query: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested search_query" do
  #     search_query = SearchQuery.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: search_query.to_param}, session: valid_session
  #     }.to change(SearchQuery, :count).by(-1)
  #   end
  #
  #   it "redirects to the search_queries list" do
  #     search_query = SearchQuery.create! valid_attributes
  #     delete :destroy, params: {id: search_query.to_param}, session: valid_session
  #     expect(response).to redirect_to(search_queries_url)
  #   end
  # end

end