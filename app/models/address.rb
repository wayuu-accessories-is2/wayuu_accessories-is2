class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country

  ######################
  #     Validations    #
  ######################

  validates :address, presence: true
  validates :city, presence: true

end
