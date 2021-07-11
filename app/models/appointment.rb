class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :employee

  validates :startDate, :endDate, :reason, presence: true

end
