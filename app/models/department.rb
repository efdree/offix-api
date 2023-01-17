class Department < ApplicationRecord
  has_one_attached :cover
  has_many :employees, dependent: :destroy
end
