class Patient < ApplicationRecord
    has_many :insurances
    has_many :appointments
    has_many :employees, through: :appointments
    has_many :prescriptions
    has_many :employees, through: :prescriptions
    has_many :lab_results

    validates :name, :date_of_birth, :phone_number, presence: true

end
