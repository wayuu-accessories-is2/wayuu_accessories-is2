class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.references :customer, foreign_key: true
      t.references :country, foreign_key: true
      t.timestamps
    end
  end
end
