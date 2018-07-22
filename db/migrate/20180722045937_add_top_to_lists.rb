class AddTopToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :top, :boolean, default: false, null: false
  end
end
