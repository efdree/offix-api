class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :nationality, :email, :position, :birth_date, :department_id, :manager_id, :role, :created_at, :updated_at
end