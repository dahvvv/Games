class BoardspacesController < ApplicationController

  patch '/' do
    content_type :json
    position = params[:position]
    user_id = current_user.id
    game_id = current_user.games[0].id
    boardspace = Boardspace.find_by(game_id: game_id)
    boardspace.get_selected(user_id)
    x_or_o = current_user.x_or_o
    {position: position, x_or_o: x_or_o, my_turn: current_user.my_turn}.to_json
  end

end
