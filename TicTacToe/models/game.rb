class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players
  has_many :boardspaces

  def initialize
    9.times do |i|
      Boardspace.create({game_id: self.id, position: i})
    end
  end

end