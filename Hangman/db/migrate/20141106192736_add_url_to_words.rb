class AddUrlToWords < ActiveRecord::Migration
  def change
    add_column :words, :url, :string
  end
end
