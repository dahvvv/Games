class UsersController < ApplicationController

  get '/new' do
    erb :'/users/new'
  end

  post '/new' do
    user = User.new(params[:user])
    user.password = params[:password]
    user.save!
    redirect "/users/profile"
  end

  get '/profile' do
    authenticate!
    erb :'/users/profile'
  end

end