class Order < ApplicationRecord
  has_one :OrderStatus
  has_one :country
  belong_to :CouponUse
  has_one :customer
  belong_to :ConfirmationOrder
  has_one :cart

end
