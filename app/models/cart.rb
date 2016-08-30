class Cart < ApplicationRecord
  belongs_to :customer
  has_many :line_product
  has_one :order
end
