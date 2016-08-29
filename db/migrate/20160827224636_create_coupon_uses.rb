class CreateCouponUses < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_uses do |t|
      t.float :amount
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
