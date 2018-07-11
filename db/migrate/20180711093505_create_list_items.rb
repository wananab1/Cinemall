class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.integer :list_id, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
  end
end
