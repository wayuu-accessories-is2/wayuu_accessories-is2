class Review < ApplicationRecord
  has_one :customer
  has_one :product
end
