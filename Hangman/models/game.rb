class Game < ActiveRecord::Base
  belongs_to :user
  has_many :guesses

  def url
    word = Word.find_by(name: self.word)
    word.url
  end

end
