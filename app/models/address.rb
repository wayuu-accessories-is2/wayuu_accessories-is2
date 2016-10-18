class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country

  ######################
  #     Validations    #
  ######################

  Validations :address, presence: true
  Validations :city, presence: true

end
