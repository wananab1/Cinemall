class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :list_name, null: false
      t.text :list_intro, null: false

      t.timestamps
    end
  end
end
