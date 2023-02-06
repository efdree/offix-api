class FeedbacksController < ApplicationController
  skip_before_action :require_login!
  before_action :set_feedback, only: %i[show update destroy]

  def index
    @feedbacks = Feedback.all
    render json: @feedbacks
  end

  def show
    if params[:employee_id]
      @feedback = Feedback.where(params[:employee_id])      
    elsif params[:department_id]
      @feedback = Feedback.where(params[:department_id])
    end

    render json: @feedback
  end

  def create
    if params[:employee_id]
      feedbackable = Employee.find(params[:employee_id])      
    elsif params[:department_id]
      feedbackable = Department.find(params[:department_id])
    end
    @feedback = Feedback.new(feedback_params)

    @feedback.feedbackable = feedbackable

    @feedback.employee_id = current_user.id

    if @feedback.save
      render json: @feedback.feedbackable, status: :created
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  def update
    if @feedback.update(feedback_params)
      render json: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
  end
  
  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.permit(:body, :employee_id, :feedbackable_id, :feedbackable_type)
  end
end
