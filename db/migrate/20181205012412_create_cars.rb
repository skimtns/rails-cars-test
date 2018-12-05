class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :color
      t.string :make
      t.integer :year

      t.timestamps
    end
  end
end
