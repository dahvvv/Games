class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players
  has_many :boardspaces

end

# winner
# gamestate
# gamerecord