class GamesController < ApplicationController

  get '/multiple_game_check' do
    content_type :json
    check = ((current_user.games.count > 0) ? "fail" : "pass")
    {check: check}.to_json
  end

  get '/first_or_second' do
    erb :'/games/new'
  end

  get '/new' do
  end

  post '/' do
    current_user.start_game
  end

end
