class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players
  has_many :boardspaces

  def start

  end

end


# has whose_turn which is a user_id, begins empty

# add first boolean to players