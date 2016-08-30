class Product < ApplicationRecord
  has_many :categories, through: :categoryHasProduct
  has_many :product_images
  belongs_to :stock_status
  has_many :reviews
  has_one :return
end
