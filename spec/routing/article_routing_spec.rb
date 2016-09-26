# spec/models/article.rb

require 'rails_helper'

RSpec.describe ArticlesController, type: :routing do
    
    describe "edit article" do
        it "routes to #edit" do
            expect(:get => "/articles/edit").to route_to("controller"=>"articles", "action"=>"show", "id"=>"edit")
        end
    end
end