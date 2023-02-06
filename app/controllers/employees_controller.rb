class EmployeesController < ApplicationController
  skip_before_action :require_login!, only: :create
  before_action :set_employee, only: %i[show update destroy]

  def index
    @employees = Employee.all
    render json: @employees
  end

  def show
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)
    unless @employee.avatar.attached?
      @employee.avatar.attach(io: File.open("app/assets/images/avatar.jpeg"), filename: "avatar.jpeg")
    end
    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee, status: :ok
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  end
  
  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.permit(:name, :nationality, :email, :position, :department_id, :birth_date, :manager_id, :role, :avatar, :password)
  end

end
