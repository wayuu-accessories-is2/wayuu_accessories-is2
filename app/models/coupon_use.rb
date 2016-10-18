class CouponUse < ApplicationRecord
  belongs_to :customer
  has_one :coupon
  has_one :order
end
