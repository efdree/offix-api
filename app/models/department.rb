class Department < ApplicationRecord
  has_one_attached :cover
  has_many :employees, dependent: :destroy
  has_many :reveived_feedbacks, class_name: "Feedback", as: :feedbackable, dependent: :destroy
end
