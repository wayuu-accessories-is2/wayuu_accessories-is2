class Order < ApplicationRecord
  belongs_to :OrderStatus
  belongs_to :country
  belongs_to :customer
  belongs_to :cart
  has_one :return
end
