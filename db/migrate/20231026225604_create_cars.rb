class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.integer :autonomy
      t.decimal :rental_price

      t.timestamps
    end
    add_index :cars, :model, unique: true
  end
end
