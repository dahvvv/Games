class Boardspace < ActiveRecord::Base
  belongs_to :game

  def get_selected(user_url)

  end

end

# status (empty, player1, player2)
