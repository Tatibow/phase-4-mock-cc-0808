class Camper < ApplicationRecord
    #associations
    has_many :signups
    has_many :activities, through: :signups

    #validations
    validates :name, presence: true
    validates :age, numericality: { in: 8..18 }

end
