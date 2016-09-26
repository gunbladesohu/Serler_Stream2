# spec/models/article.rb

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe "handling GET index" do
        before do
            @article = (1..20).map { |i| (Article) }
            
            allow(Article).to receive(:update).and_return(@article)
            @article_params=double("params")
            #allow(:controller).to receive(:set_article)
            #controller.stub(:set_article)
        end
        
        def do_get
            get :index
        end
        
        it "should be successful" do
            do_get
            expect(response).to be_success
        end
        
        it "should render index template" do
            do_get
            expect(response).to render_template('index')
        end
  
        it "should parse list_params" do
            #expect(controller).to receive(:article_params).with(Article)
            do_get
        end
        
    end
    describe "PUT update/:id" do
        describe "with valid params" do
        let(:attr) do 
            { :title => 'Cyber Security', :journal => 'Journal123', :year => '2016', :volume =>'4',
        :number => '5', :month => 'January', :research_questions => 'How to deal with cyber security?', :research_metrics => 'Metrics123',  
                :research_method_ids =>[1, 3, 4, 5]#, "research_participant_ids"=>["3"], "dev_method_ids"=>["2", "6"], "methodology_ids"=>["7", "8", "9", "11"]  
                
            }
        end
            
        before(:each) do
            @article = Article.new(attr)
                put :update, {:id => @article.id, :article => attr, format: :json}
                @article.reload
            end

            #it { expect(response).to redirect_to(@article) }
            it { expect(@article.title).to eql attr[:title] }
       #     it { expect(@article.content).to eql attr[:content] }
        end
    end
end