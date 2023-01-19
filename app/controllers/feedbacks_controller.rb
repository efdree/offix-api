class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show update destroy]

  def show
    render json: @feedback
  end

  def create
    if params[:employee_id]
      feedbackable = Employee.find(params[:employee_id])      
    elsif params[:department_id]
      feedbackable = Department.find(params[:deparment_id]) 
    end
    @feedback = Feedback.new(feedback_params)
    @feedback.feedbackable = feedbackable

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
    params.require(:feedback).permit(:body, :employee_id)
  end
end
