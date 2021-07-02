class InsuranceSerializer < ActiveModel::Serializer
  attributes :id, :group_number, :name, :subscriber_name, :subscriber_number
  has_one :patient
end
