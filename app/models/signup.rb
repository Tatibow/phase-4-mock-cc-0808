class Signup < ApplicationRecord
    #associations
    belongs_to :camper
    belongs_to :activity

    #validations
    validates :time, inclusion: 0..23
end
