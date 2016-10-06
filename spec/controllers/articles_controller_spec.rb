require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe "handling GET index" do
    before do
      session[:user_id] = user.id
    end

    it "should be successful" do
      get :index, session: session
      #byebug
      expect(response).to be_success
    end
  end
end
