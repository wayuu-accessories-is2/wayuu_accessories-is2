class CreateConfirmationOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmation_orders do |t|
      t.string :description
      t.string :code
      t.float :amount
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
