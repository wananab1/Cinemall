class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.decimal :score, default: 0.0, null: false, precision: 2, scale: 1
      t.boolean :secret, default: false, null: false
      t.integer :movie_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
