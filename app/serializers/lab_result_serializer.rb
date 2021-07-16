class LabResultSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :doctor_name
end
