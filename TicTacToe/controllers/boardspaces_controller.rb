class BoardspacesController < ApplicationController

  patch '/' do
    content_type :json
    position = params[:position]
    my_turn = params[:my_turn]
    user_id = current_user.id
    game_id = current_user.games[0].id
    boardspace = Boardspace.find_by(game_id: game_id)
    boardspace.get_selected(user_id)
    {user_id: user_id}.to_json
  end

end
