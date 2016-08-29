class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :comment
      t.integer :rating
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
