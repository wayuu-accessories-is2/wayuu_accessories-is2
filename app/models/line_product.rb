class LineProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
