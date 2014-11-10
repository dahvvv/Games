class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

  enable :sessions, :method_override

  before do
    @conn = ActiveRecord::Base.establish_connection({
      adapter: 'postgresql',
      database: 'tictactoe_db'
      })
  end

  after do
    @conn.disconnect!
  end

  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public_folder", __FILE__)

  get '/' do
    erb :index
  end

  get '/console' do
    binding.pry
  end

end
