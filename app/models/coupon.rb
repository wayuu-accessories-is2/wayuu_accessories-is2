class Coupon < ApplicationRecord
  has_one :couponUse, optional: true
end
