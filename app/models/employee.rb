class Employee < ApplicationRecord
  has_secure_token
  has_secure_password

  belongs_to :department,  counter_cache: true
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :reports, class_name: "Employee", foreign_key: "manager_id", dependent: :destroy, inverse_of: "manager"
  has_one_attached :avatar
  has_many :feedbacks, dependent: :destroy
  has_many :reveived_feedbacks, class_name: "Feedback", as: :feedbackable, dependent: :destroy

  enum role: { admin: 0, regular: 1 }

  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  validates :name, presence: true

  def invalidate_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    employee = Employee.find_by(email:)
    return false unless employee&.authenticate(password)
    
    employee.regenerate_token
    employee
  end
end
