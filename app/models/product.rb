class Product < ApplicationRecord
  has_many :categories, through: :categoryHasProduct
  has_many :product_images
  has_many :reviews
  has_one :return

  ######################
  #     Validations    #
  ######################

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  #validates :description, presence: true

end
