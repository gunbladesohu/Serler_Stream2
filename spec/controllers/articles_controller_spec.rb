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
  
  describe "PUT update/:id" do
        describe "with valid params" do
        let(:attr) do
            { :id => 163, :title => 'The impacts of agile and lean practices on project constraints: A tertiary study', 
            :journal => 'Journal of Systems and Software', #:year => '2016', :volume =>'4',
        #:number => '5', :month => 'January', :research_questions => 'How to deal with cyber security?', :research_metrics => 'Metrics123',
                # :research_method_ids =>[6, 7], "research_participant_ids"=>["3"]
                # , "dev_method_ids"=>["2", "6"], "methodology_ids"=>["7", "8", "9", "11"]
    
            }
        end
    
        before(:each) do
            @article = Article.new(attr)
                put :update, {:id => @article.id, :article => attr}
                # @article.reload
            end
    
            #it { expect(response).to redirect_to(@article) }
            it { expect(@article.title).to eql attr[:title] }
            it { expect(@article.journal).to eql attr[:journal] }
            # it { expect(@article.research_method_ids).to eql attr[:research_method_ids] }
        #     it { expect(@article.content).to eql attr[:content] }
        end
    end
    
    describe "PUT create/:id" do
        describe "with valid params" do
        let(:attr) do
            { :id => 180, :title => 'Addressing the challenges of combining Software Methodologies', 
             :journal => 'Journal of Systems and Software', #:year => '2016', :volume =>'4',
        #:number => '5', :month => 'January', :research_questions => 'How to deal with cyber security?', :research_metrics => 'Metrics123',
                # :research_method_ids =>[6, 7], "research_participant_ids"=>["3"]
                # , "dev_method_ids"=>["2", "6"], "methodology_ids"=>["7", "8", "9", "11"]
    
            }
        end
    
        before(:each) do
            @article = Article.new(attr)
                put :create, {:id => @article.id, :article => attr}
                # @article.reload
            end
    
            #it { expect(response).to redirect_to(@article) }
            it { expect(@article.title).to eql attr[:title] }
            it { expect(@article.journal).to eql attr[:journal] }
            # it { expect(@article.research_method_ids).to eql attr[:research_method_ids] }
        #     it { expect(@article.content).to eql attr[:content] }
        end
    end
end
