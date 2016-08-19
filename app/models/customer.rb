class Customer < ApplicationRecord
  has_many :customer
  has_many :order
  has_many :cart
  has_many :CouponUse
  has_many :address
  has_many :review
end
