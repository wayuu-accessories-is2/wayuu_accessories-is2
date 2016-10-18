class Product < ApplicationRecord
  has_many :categories, through: :categoryHasProduct
  has_many :product_images
  has_many :reviews
  has_one :return

  ######################
  #     Validations    #
  ######################

  Validations :name, presence: true
  Validations :quantity, presence: true
  Validations :price, presence: true
  Validations :description, presence: true

end
