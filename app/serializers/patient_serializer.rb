class PatientSerializer < ActiveModel::Serializer
  attributes :id, :address, :date_of_birth, :email, :ethnicity, :language, :name, :phone_number, :race, :username
end
