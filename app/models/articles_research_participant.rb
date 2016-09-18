class ArticlesResearchParticipant < ActiveRecord::Base
  belongs_to :article
  belongs_to :research_participant
end
