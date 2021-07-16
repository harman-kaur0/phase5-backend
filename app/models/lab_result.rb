class LabResult < ApplicationRecord
  belongs_to :patient

  validates :name, :date, :url, presence: true 
end
