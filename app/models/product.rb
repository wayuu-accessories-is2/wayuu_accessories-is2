class Product < ApplicationRecord
  has_many :categories, through: :categoryHasProduct
  has_many :product_images
  has_many :reviews
  has_one :return
end
