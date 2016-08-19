class CreateReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :returns do |t|
      t.integer :quantity
      t.integer :opened
      t.string :return_status
      t.string :comment
      t.timestamps
    end
  end
end
