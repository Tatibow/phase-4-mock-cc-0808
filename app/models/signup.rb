class Signup < ApplicationRecord
    #associations
    belongs_to :camper
    belongs_to :activity

    #validations
    validates :time, numericality: { in: 0..23 }
end
