class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :reason, :endDate
  has_one :patient
  has_one :employee
end
