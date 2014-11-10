require 'bundler'
Bundler.require

Dir.glob("./{helpers,models,controllers}/*.rb").each do |file|
  require file
  puts "Required #{file}"
end

map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/games'){ run GamesController }
map('/players'){ run PlayersController }
map('/'){ run ApplicationController }
