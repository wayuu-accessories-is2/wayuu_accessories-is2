class Address < ApplicationRecord
  has_one :customer
  has_one :country
end
