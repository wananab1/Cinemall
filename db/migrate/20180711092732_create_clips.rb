class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false

      t.timestamps
    end
  end
end
