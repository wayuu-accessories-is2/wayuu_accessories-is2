class CreateCouponUses < ActiveRecord::Migration[5.0]
  def change
    create_table :coupon_uses do |t|
      t.float :amount
      t.timestamps
    end
  end
end
