class Patient < ApplicationRecord
    has_many :insurances
    has_many :appointments
    has_many :employees, through: :appointments
    has_many :prescriptions
    has_many :employees, through: :prescriptions

    validates :name, :date_of_birth, :address, :phone_number, :ethnicity, :race, :language, presence: true

end
