class Game < ActiveRecord::Base
  has_many :favorites

  validates :title, presence: true
  validates :title, uniqueness: { scope: :platform, message: "this game already exists for this platform" }

  validates :platform, presence: true
  validates :developer, presence: true
  validates :genre, presence: true
end
