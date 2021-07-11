class PatientSerializer < ActiveModel::Serializer
  attributes :id, :address, :date_of_birth, :email, :ethnicity, :language, :name, :phone_number, :race, :username, :prescriptions
  has_many :insurances
  has_many :appointments

  def prescriptions
    object.prescriptions.map{|p| PrescriptionSerializer.new(p)}
  end
end
