class BoardspacesController < ApplicationController

  patch '/' do
    content_type :json
    position = params[:position]
    user_id = current_user.id
    game_id = current_user.games[0].id
    boardspace = Boardspace.find_by(game_id: game_id)
    boardspace.get_selected(user_id)
    x_o_from_status = boardspace.x_o_from_status
    {position: position, xOFromStatus: x_o_from_status}.to_json
  end

end
