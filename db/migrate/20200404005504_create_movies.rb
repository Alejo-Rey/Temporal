class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :url_img
      t.datetime :day_function

      t.timestamps
    end
  end
end
