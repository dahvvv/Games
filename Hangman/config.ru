require 'bundler'
Bundler.require

Dir.glob("./{helpers,models,controllers}/*.rb").each do |file|
  require file
  puts "required #{file}"
end

map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/games'){ run GamesController }
map('/guesses'){ run GuessesController }
map('/'){ run ApplicationController }
