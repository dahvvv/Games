class PlayersController < ApplicationController

  post '/' do
    content_type :json
    game_id = params[:game_id]
    current_user.join_game(game_id)
    {game_id: game_id}.to_json
  end

end
