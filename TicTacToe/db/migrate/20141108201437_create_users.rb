class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :profile_pic
      t.string :favorite_quote
      t.string :hometown
      t.string :board_pics

      t.timestamps
    end
  end
end
