class Order < ApplicationRecord
  has_one :OrderStatus
  has_one :country
  has_one :customer
  has_one :cart
end
