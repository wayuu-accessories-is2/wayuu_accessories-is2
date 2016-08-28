class Category < ApplicationRecord
  has_one :category_filter
  has_many :product, through: :category_has_product
end
