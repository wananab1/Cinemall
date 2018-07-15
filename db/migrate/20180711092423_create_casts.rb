class CreateCasts < ActiveRecord::Migration[5.1]
  def change
    create_table :casts do |t|
      t.boolean :actor, default: true, null: false
      t.boolean :director, default: false, null: false
      t.boolean :scenario, default: false, null: false
      t.integer :movie_id, null: false
      t.integer :person_id, null: false
      t.string :p_name, null: false


      t.timestamps
    end
  end
end
