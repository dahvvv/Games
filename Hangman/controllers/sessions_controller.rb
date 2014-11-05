class SessionsController < ApplicationController

  get '/new' do
    erb :'/sessions/new'
  end

  post '/new' do
    redirect '/sessions/new' unless user = User.find_by(username: params[:user][:username])
    if user.password == params[:password]
      session[:current_user] = user.id
      redirect '/'
    else
      redirect '/sessions/new'
    end
  end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
  end

end
