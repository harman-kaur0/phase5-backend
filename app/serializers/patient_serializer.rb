class PatientSerializer < ActiveModel::Serializer
  attributes :id, :address, :date_of_birth, :email, :ethnicity, :language, :name, :phone_number, :race, :username
  has_many :prescriptions
  has_many :insurances
end
