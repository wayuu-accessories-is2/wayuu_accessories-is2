class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.float :weight
      t.float :width
      t.float :height
      t.string :status
      t.string :description
      t.references :stock_status, foreign_key: true

      t.timestamps
    end
  end
end
