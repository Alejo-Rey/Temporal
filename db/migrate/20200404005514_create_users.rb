class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :identification
      t.string :name
      t.string :email
      t.string :cellphone

      t.timestamps
    end
  end
end
