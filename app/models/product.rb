class Product < ApplicationRecord
  has_many :product_image
  has_one :stock_status
  has_many :review
end
