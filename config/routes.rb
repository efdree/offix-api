Rails.application.routes.draw do
  resources :employees do
    #/employees/employee_id/feedbacks
    resources :feedbacks
  end
  resources :departments do
    #/departments/department_id/feedbacks
    resources :feedbacks
  end

  resources :feedbacks

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
