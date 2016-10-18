class Category < ApplicationRecord
  has_many :product, through: :categoryHasProduct

  validates :name, presence: true
  validates :description, presence: true

end
