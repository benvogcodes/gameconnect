class User < ActiveRecord::Base
  has_many :favorites

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
end
