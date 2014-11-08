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

  def id_by_username(username)
    self.find_by(username: username).id
  end

  def start_game
    game = Game.create
    Player.create({user_id: self.id, game_id: game.id})
  end

  def join_game(other_username)
    if game = Game.find(User.id_by_username(other_username))
      if game.users.count == 1
        player = Player.create({user_id: self.id, game_id: game.id})
      else
        return "That game already has two players!"
      end
    end
  end
end
