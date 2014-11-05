class SessionsController < ApplicationController

  get '/new' do
    erb :'/sessions/new'
  end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
  end

end
