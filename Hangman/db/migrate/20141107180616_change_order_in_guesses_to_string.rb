class ChangeOrderInGuessesToString < ActiveRecord::Migration
  def change
    change_column :guesses, :order, :string
  end
end
