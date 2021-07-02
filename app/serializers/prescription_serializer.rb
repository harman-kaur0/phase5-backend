class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :directions, :quantity, :approved, :notes
  has_one :patient
  has_one :employee
end
