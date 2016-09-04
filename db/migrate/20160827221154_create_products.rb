class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.float :length
      t.float :width
      t.float :height
      t.string :status, :default => 1
      t.string :description
      t.timestamps
    end
  end
end
