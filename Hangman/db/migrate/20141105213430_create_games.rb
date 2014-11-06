class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :word
      t.integer :elapsed_seconds
      t.integer :score
      t.boolean :won
      t.references :user

      t.timestamps
    end
  end
end
