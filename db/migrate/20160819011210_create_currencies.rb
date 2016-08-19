class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :title
      t.string :code
      t.string :symbol
      t.integer :status
      t.timestamps
    end
  end
end
