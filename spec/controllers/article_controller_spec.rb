# spec/models/article.rb

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  #
  # describe"administrator access"do
  #   before :each do
  #     user = create(:admin)
  #     session[:user_id] = user.id
  #   end
  #
  #   describe 'GET #index' do
  #     it "populates an array of contacts" do
  #       get :index
  #       expect(assigns(:article)).to match_array [@article]
  #     end
  #   end
  # end

    let(:user) { FactoryGirl.create(:user) }

    describe "handling GET index" do
      before do
        session[:user_id] = user.id
      end

      it "should be successful" do
        get :index, session: session
        byebug
        expect(response).to be_success
      end
        # it "should render index template" do
        #     do_get
        #     expect(response).to render_template(:new)
        # end
        #
        # it "should parse list_params" do
        #     #expect(controller).to receive(:article_params).with(Article)
        #     do_get
        # end

    end
    # describe "PUT update/:id" do
    #     describe "with valid params" do
    #     let(:attr) do
    #         { :id => "4", :title => 'Cyber Security', :journal => 'Journal123', :year => '2016', :volume =>'4',
    #     :number => '5', :month => 'January', :research_questions => 'How to deal with cyber security?', :research_metrics => 'Metrics123',
    #             :research_method_ids =>[6, 7]#, "research_participant_ids"=>["3"], "dev_method_ids"=>["2", "6"], "methodology_ids"=>["7", "8", "9", "11"]
    #
    #         }
    #     end
    #
    #     before(:each) do
    #         @article = Article.new(attr)
    #             put :update, {:id => @article.id, :article => attr}
    #             # @article.reload
    #         end
    #
    #         #it { expect(response).to redirect_to(@article) }
    #         it { expect(@article.title).to eql attr[:title] }
    #    #     it { expect(@article.content).to eql attr[:content] }
    #     end
    # end
end
