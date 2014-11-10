class GamesController < ApplicationController

  get '/multiplegamecheck' do
    content_type :json
    check = ((current_user.games.count > 0) ? "fail" : "pass")
    {check: check}.to_json
  end

  get '/new' do
  end

  post '/' do
  end

end
