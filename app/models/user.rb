class User < ActiveRecord::Base
  has_many :favorites

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, confirmation: true
end
