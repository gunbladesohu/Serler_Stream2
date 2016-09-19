require "rails_helper"

RSpec.describe AdminController, type: :routing do
  describe "routing" do

    it "routes to article view page" do
      expect(:get => "/admin/article_view").to route_to("admin#article_view")
    end

    it "routes to add new development method page" do
      expect(:get => "/admin/add_dev_method").to route_to("admin#add_dev_method")
    end

    it "routes to home page" do
      expect(:get => "/").to route_to("home#index")
    end

    # # it "routes to #show" do
    # #   expect(:get => "/search_queries/1").to route_to("search_queries#show", :id => "1")
    # # end
    # #
    # # it "routes to #edit" do
    # #   expect(:get => "/search_queries/1/edit").to route_to("search_queries#edit", :id => "1")
    # # end

    # it "routes to #create" do
    #   expect(:post => "/search_queries").to route_to("search_queries#create")
    # end

    # # it "routes to #update via PUT" do
    # #   expect(:put => "/search_queries/1").to route_to("search_queries#update", :id => "1")
    # # end
    # #
    # # it "routes to #update via PATCH" do
    # #   expect(:patch => "/search_queries/1").to route_to("search_queries#update", :id => "1")
    # # end
    # #
    # # it "routes to #destroy" do
    # #   expect(:delete => "/search_queries/1").to route_to("search_queries#destroy", :id => "1")
    # # end

  end
end