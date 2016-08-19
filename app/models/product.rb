class Product < ApplicationRecord
  belong_to :product_discount
  has_many :product_image
  has_one :stock_status
  belong_to :return
  has_many :category, through: category_has_product
  has_many :review
end
