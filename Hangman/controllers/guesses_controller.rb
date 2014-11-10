class GuessesController < ApplicationController

  post '/' do
    content_type :json
    guess = Guess.new(params[:guess])

    if params[:order] != nil
      order_array = params[:order].map { |num| num.to_i }
      guess.order = order_array.to_s
    else
      guess.order = [].to_s
    end

    guess.save!

    game = Game.find(params[:guess][:game_id])
    wrong_count = game.guesses.where("in_word=false").count
    guessed = game.all_necessary_letters.map { |necessary_letter| game.all_guessed_letters.include?(necessary_letter) }

    if wrong_count == 10
      game.won = false
      game.save!
    end
    if guessed.include?(false) == false
      game.won = true
      game.save!
    end

    {letter: guess.letter, in_word: guess.in_word, order: order_array, id: guess.id, wrong_count: wrong_count, won: game.won}.to_json
  end

end