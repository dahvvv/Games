class Boardspace < ActiveRecord::Base
  belongs_to :game

  def get_selected(username)
    if self.status == "empty"
      self.status = User.id_by_username(username)
    else
      return "You can't select this space, it's already occupied!"
    end
  end

end

# status (empty, player1, player2, default: empty)
# position
