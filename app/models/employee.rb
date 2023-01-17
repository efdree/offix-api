class Employee < ApplicationRecord
  belongs_to :department,  counter_cache: true
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :reports, class_name: "Employee", foreign_key: "manager_id", dependent: :destroy, inverse_of: "manager"
end
