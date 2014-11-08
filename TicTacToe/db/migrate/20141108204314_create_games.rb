class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :winner
      t.string :gamestate
      t.string :gamerecord

      t.timestamps
    end
  end
end
