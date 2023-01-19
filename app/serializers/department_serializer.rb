class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :employees_count, :created_at, :updated_at
end