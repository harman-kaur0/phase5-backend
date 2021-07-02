class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :role, :email, :username, :title

end
