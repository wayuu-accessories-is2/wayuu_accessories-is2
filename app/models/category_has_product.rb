class CategoryHasProduct < ApplicationRecord
  has_one :Category
  has_one :product
end
