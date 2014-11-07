class GuessesController < ApplicationController

  post '/' do
    content_type :json
    guess = Guess.new(params[:guess])
    order_array = params[:order].map { |num| num.to_i }
    guess.order = order_array.to_s
    guess.save!
    {letter: guess.letter, in_word: guess.in_word, order: order_array, id: guess.id}.to_json
  end

end



# get '/api/toonify' do
#   content_type :json

#   accent_sent_from_client = params[:accentFromClient]
#   sentence_sent_from_client = params[:sentenceFromClient]

#   case accent_sent_from_client
#   when 'daffy'
#     sentence_processed_by_server = sentence_sent_from_client.gsub(/s/i, 'th')
#   when 'elmer'
#     sentence_processed_by_server = sentence_sent_from_client.gsub(/r/i, 'w')
#   else
#     sentence_processed_by_server = sentence_sent_from_client
#   end

#     {
#       accent_from_server: accent_sent_from_client,
#       sentence_from_server: sentence_processed_by_server
#     }.to_json