class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :letter
      t.boolean :in_word
      t.integer :order
      t.references :game

      t.timestamps
    end
  end
end
