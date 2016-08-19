class LineProduct < ApplicationRecord
  has_one :cart
  has_one :product
end
