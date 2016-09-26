# spec/factories/articles.rb
require 'faker'


FactoryGirl.define do
    factory :article do |f|
        f.researchmethods { Faker::Article.research_methods}
    end
end