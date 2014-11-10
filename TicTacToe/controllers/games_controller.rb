class GamesController < ApplicationController

  get '/multiple_game_check' do
    content_type :json
    starter_or_joiner = params[:starter_or_joiner]
    check = ((current_user.games.count > 0) ? "fail" : "pass")
    game_id = (starter_or_joiner == "joiner" ? params[:game_id] : "irrelevant")
    {check: check, starter_or_joiner: starter_or_joiner, game_id: game_id}.to_json
  end

  get '/first_or_second' do
    authenticate!
    erb :'/games/new'
  end

  get '/join' do
    authenticate!
    @open_games = Game.all.select { |game| game.players.count==1 }
    erb :'/games/join'
  end

  get '/join/:id' do
    authenticate!
    id = params[:id]
    current_user.join_game(id)
    redirect "/games/#{id}"
  end

  get '/resume' do
    authenticate!
    if current_user.games.count == 1
      id = current_user.games[0].id
      redirect "/games/#{id}"
    else
      erb :'/errors/cant_resume_game'
    end
  end

  get '/:id' do
    authenticate!
    @game = Game.find(params[:id])
    erb :'/games/show'
  end

  post '/' do
    content_type :json
    first = params[:first]
    current_user.start_game(first)
    username = current_user.username
    {username: username}.to_json
  end

  patch '/' do
    content_type :json
    user = User.find(params[:user_id])
    {my_turn: my_turn}.to_json
  end

end
