class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :employee

  validates :name, :directions, :quantity, presence: true
end
