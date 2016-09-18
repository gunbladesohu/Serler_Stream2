class ArticlesResearchMethod < ActiveRecord::Base
  belongs_to :article
  belongs_to :research_method
end
