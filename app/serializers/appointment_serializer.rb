class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date_and_time, :reason
  has_one :patient
  has_one :employee
end
