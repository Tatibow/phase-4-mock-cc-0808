class Activity < ApplicationRecord
       #associations
    has_many :signups, dependent: :destroy 
    has_many :campers, through: :signups
end
