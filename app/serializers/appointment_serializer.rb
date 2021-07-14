class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :reason, :endDate
  has_one :employee
  has_one :patient
end
