class Favorite < ActiveRecord::Base
  validates :user_id, valid: true
  validates :game_id, valid: true

  belongs_to :user
  belongs_to :game
end
