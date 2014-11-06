class Guess < ActiveRecord::Base
  belongs_to :game
  # delegate :user, to: :game

end
