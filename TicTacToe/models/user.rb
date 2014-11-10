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

  def join_game(other_username)
    if self.games.count == 0
      if opponent_user = User.find_by(username: other_username)
        if opponent_user.games.count == 1
          game = opponent_user.games[0]
          if game.players.count == 1
            if game.users[0].id != self.id
              opponent_player = game.players[0]
              player = Player.create({user_id: self.id, game_id: game.id, first: (opponent_player.first == true ? false : true)})
              game.start
            else
              return "You can't play against yourself!"
            end
          else
            return "That game already has two players!"
          end
        else
          return "That user doesn't have an open game!"
        end
      else
        return "There is no user registered under that name!"
      end
    else
      return "You can't play more than one game at a time!"
    end
  end

  def select_boardspace(position, game_id)
    space = Boardspace.find_by({position: position, game_id: game_id})
    space.get_selected(self.username)
  end
end
