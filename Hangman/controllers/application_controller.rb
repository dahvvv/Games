class ApplicationController < Sinatra::Base

  enable :sessions, :method_override

  before do
    @connection = ActiveRecord::Base.establish_connection({
      adapter: 'postgresql',
      database: 'hangman_db'
      })
  end

  after do
    @connection.disconnect!
  end

  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public_folder", __FILE__)

  get '/' do
    erb :index
  end

end