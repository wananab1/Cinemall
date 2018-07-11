class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :j_title
      t.string :e_title
      t.date :release
      t.integer :time
      t.text :summary
      t.text :movie_image_id
      t.string :trailer_id
      t.decimal :score_average, default: 0.0, null: false, precision: 2, scale: 1
      t.integer :genre_id, null: false
      t.integer :country_id, null: false
      t.integer :company_id, null: false

      t.timestamps
    end
  end
end
