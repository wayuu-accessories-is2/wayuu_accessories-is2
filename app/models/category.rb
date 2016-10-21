class Category < ApplicationRecord
  has_many :product, through: :categoryHasProduct

  ######################
  #     Validations    #
  ######################

#  Validations :name, presence: true
#  Validations :description, presence: true

end
