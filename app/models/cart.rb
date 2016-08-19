class Cart < ApplicationRecord
  has_one :customer
  has_many :line_product
end
