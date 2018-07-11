class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :person_name, null: false

      t.timestamps
    end
  end
end
