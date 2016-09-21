class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.string :comment
      t.integer :rating
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
