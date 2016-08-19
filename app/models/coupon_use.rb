class CouponUse < ApplicationRecord
  has_one :customer
  has_one :coupon
  has_one :order
end
