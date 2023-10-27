class CreateCharacteristicCars < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristic_cars do |t|
      t.references :car, null: false, foreign_key: true
      t.references :characteristic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
