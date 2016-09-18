class User < ActiveRecord::Base

  # Trung - Define model associations
  has_many :users_roles
  has_many :roles, through: :users_roles
  has_many :feedbacks
  has_many :ratings
  has_many :article_users
  has_many :article, through: :article_users

end
