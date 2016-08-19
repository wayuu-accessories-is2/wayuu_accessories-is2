class CreateCustomerTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_transactions do |t|
      t.string :description
      t.float :amount
      t.timestamps
    end
  end
end
