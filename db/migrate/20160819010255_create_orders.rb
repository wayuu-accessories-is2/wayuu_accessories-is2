class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :tel
      t.string :payment_firstname
      t.string :payment_lastname
      t.string :payment_company
      t.string :payment_address
      t.string :payment_postcode
      t.string :payment_method
      t.string :payment_code
      t.string :shipping_firstname
      t.string :shipping_lastname
      t.string :shipping_company
      t.string :shipping_address
      t.string :shipping_postcode
      t.float :total
      t.string :currency

      t.timestamps
    end
  end
end
