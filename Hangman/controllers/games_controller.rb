class GamesController < ApplicationController

  get '/new' do
    @game = Game.new(word: Word.all.sample.name)
    if session[:current_user]
      @game.user_id = session[:current_user]
    end
    @game.save!
    erb :'/games/new'
  end

end