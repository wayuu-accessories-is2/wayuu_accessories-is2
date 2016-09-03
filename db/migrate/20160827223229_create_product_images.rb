class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.string :link
      t.integer :sort_order
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
