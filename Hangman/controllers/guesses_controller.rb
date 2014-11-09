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
    {letter: guess.letter, in_word: guess.in_word, order: order_array, id: guess.id}.to_json
  end

end