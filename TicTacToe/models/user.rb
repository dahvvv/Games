class User < ActiveRecord::Base
  include BCrypt

  has_many :players
  has_many :games, through: :players

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.id_by_username(username)
    self.find_by(username: username).id
  end

  def start_game(first)
    game = Game.create
    9.times do |i|
      Boardspace.create({game_id: game.id, position: i})
    end
    Player.create({user_id: self.id, game_id: game.id, first: first})
  end

  def delete_game(game_id)
    game = Game.find(game_id)
    game.destroy
  end

  def join_game(game_id)
    opponent = Player.find_by(game_id: game_id)
    player = Player.create({user_id: self.id, game_id: game_id, first: (opponent.first == true ? false : true)})
  end

  def select_boardspace(position, game_id)
    space = Boardspace.find_by({position: position, game_id: game_id})
    space.get_selected(self.username)
  end

  def x_or_o
    self.players[0].first == true ? "X" : "O"
  end

  def my_turn
    if self.players != []
      if (self.players[0].first == true) && (self.occupied_boardspaces.odd? == false)
        return true
      elsif (self.players[0].first == false) && (self.occupied_boardspaces.odd? == true)
        return true
      else
        return false
      end
    else
      return "u fucked up"
    end
  end

  def occupied_boardspaces
    if self.games != []
      self.games[0].boardspaces.where.not(status: 'empty').count
    else
      return "how did this happen??"
    end
  end
end
