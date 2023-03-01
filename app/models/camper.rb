class Camper < ApplicationRecord
    #associations
    has_many :signups
    has_many :activities, through: :signups

    #validations
    validates :name, presence: true
    validates :age, inclusion: 8..18 
  #inclusion
end
