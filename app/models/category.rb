class Category < ApplicationRecord
  has_many :product, through: :categoryHasProduct
end
