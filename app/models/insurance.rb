class Insurance < ApplicationRecord
  belongs_to :patient

  validates :name, :subscriber_name, :subscriber_number, :group_number, presence: true
end
