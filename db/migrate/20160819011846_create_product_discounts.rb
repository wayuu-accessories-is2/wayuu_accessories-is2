class CreateProductDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :product_discounts do |t|
      t.float :price
      t.datetime :start
      t.datetime :end
      t.timestamps
    end
  end
end
