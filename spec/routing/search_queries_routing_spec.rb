require "rails_helper"

RSpec.describe SearchQueriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/search_queries").to route_to("search_queries#index")
    end

    it "routes to #new" do
      expect(:get => "/search_queries/new").to route_to("search_queries#new")
    end

    it "routes to #update_values" do
      expect(:get => "/search_queries/update_values").to route_to("search_queries#update_values")
    end

    # it "routes to #show" do
    #   expect(:get => "/search_queries/1").to route_to("search_queries#show", :id => "1")
    # end
    #
    # it "routes to #edit" do
    #   expect(:get => "/search_queries/1/edit").to route_to("search_queries#edit", :id => "1")
    # end

    it "routes to #create" do
      expect(:post => "/search_queries").to route_to("search_queries#create")
    end

    # it "routes to #update via PUT" do
    #   expect(:put => "/search_queries/1").to route_to("search_queries#update", :id => "1")
    # end
    #
    # it "routes to #update via PATCH" do
    #   expect(:patch => "/search_queries/1").to route_to("search_queries#update", :id => "1")
    # end
    #
    # it "routes to #destroy" do
    #   expect(:delete => "/search_queries/1").to route_to("search_queries#destroy", :id => "1")
    # end

  end
end
