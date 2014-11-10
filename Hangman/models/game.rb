class Game < ActiveRecord::Base
  belongs_to :user
  has_many :guesses

  def url
    word = Word.find_by(name: self.word)
    word.url
  end

  def won_or_lost_yet

  end

  def all_necessary_letters
    self.word.upcase.chars.uniq.sort.reject { |char| char==" " }
  end

  def all_guessed_letters
    guessed_letters = self.guesses.map { |guess| guess.letter }
    guessed_letters.sort
  end

end
