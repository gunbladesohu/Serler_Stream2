class User < ActiveRecord::Base

  # Athena - Add constraint to email: must be unique & validate (by email_validator.rb)
  validates :email, uniqueness: true
  validates :email, presence: true #, email: true
  validates_confirmation_of :password

  # Trung - Define model associations
  has_many :users_roles
  has_many :roles, through: :users_roles
  has_many :feedbacks
  has_many :ratings
  has_many :article_users
  has_many :article, through: :article_users

#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   before_save { self.email = email.downcase }
#   validates :email, presence: true, uniqueness: { case_sensitive: false },
#             format: { with: VALID_EMAIL_REGEX }
#   validates :password, confirmation: true, length: { minimum: 8 }
#   validates :password_confirmation, presence: true

has_secure_password
end
