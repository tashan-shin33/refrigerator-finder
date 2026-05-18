class CreateRefrigerators < ActiveRecord::Migration[8.1]
  def change
    create_table :refrigerators do |t|
      t.string :product_name
      t.string :manufacturer
      t.integer :width
      t.integer :depth
      t.integer :height
      t.integer :volume
      t.integer :freezer_capacity
      t.integer :refrige
      t.integer :vegetable
      t.integer :icemaker
      t.integer :switched
      t.integer :price

      t.timestamps
    end
  end
end
