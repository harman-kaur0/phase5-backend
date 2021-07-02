class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :employee
end
