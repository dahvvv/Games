class User < ActiveRecord::Base
  include BCrypt

  has_many :games
end
