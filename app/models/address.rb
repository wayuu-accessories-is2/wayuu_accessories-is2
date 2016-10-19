class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :country
  has_many :order
  ######################
  #     Validations    #
  ######################

  validates :address, presence: true
  validates :city, presence: true

end
