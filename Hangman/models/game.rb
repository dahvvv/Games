class Game < ActiveRecord::Base
  belongs_to :user
  has_many :guesses

  def create_word

    self.word = word
  end

end
