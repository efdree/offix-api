class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :body, :employee_id, :feedbackable_type, :feedbackable_id, :created_at, :updated_at
end