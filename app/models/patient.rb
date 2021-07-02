class Patient < ApplicationRecord
    has_many :insurances
    has_many :appointments
    has_many :employees, through: :appointments

end
