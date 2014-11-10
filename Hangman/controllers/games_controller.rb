class GamesController < ApplicationController

  get '/new' do
    @game = Game.new(word: Word.all.sample.name)
    if session[:current_user]
      @game.user_id = session[:current_user]
    end
    @game.save!
    erb :'/games/new'
  end

  patch '/' do
    content_type :json
    game = Game.find(params[:game_id])
    game.elapsed_seconds = params[:elapsed_seconds]
    game.score = ((1.0/(game.elapsed_seconds))*100_000).to_i
    game.save!
    {score: game.score}.to_json
  end

end