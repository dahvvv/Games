class Guess < ActiveRecord::Base
  belongs_to :game

  def order_from_db
    self.order[1..-2].split(", ").map { |order| order.to_i }
  end

end
