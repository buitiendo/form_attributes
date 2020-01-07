class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :dob
      t.boolean :role
      t.text :description
      t.integer :city_id

      t.timestamps
    end
  end
end
