class CreateFunctions < ActiveRecord::Migration[6.0]
  def change
    create_table :functions do |t|
      t.string :movie
      t.datetime :day
      t.integer :num_chairs
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
