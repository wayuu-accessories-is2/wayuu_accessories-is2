class CreateConfirmationOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmation_orders do |t|
      t.string :description
      t.string :code
      t.float :amount
      t.timestamps
    end
  end
end
