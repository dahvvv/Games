class AddFirstToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :first, :boolean
  end
end
