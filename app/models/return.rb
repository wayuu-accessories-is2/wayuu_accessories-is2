class Return < ApplicationRecord
  has_one :product
  has_one :order
  bhas_one :customer
end
