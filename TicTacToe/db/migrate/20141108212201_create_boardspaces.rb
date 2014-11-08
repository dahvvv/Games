class CreateBoardspaces < ActiveRecord::Migration
  def change
    create_table :boardspaces do |t|
      t.string :status, default: "empty"
      t.integer :position

      t.timestamps
    end
  end
end
