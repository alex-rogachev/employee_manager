EmployeeManager::Application.routes.draw do
  root to: "admin/dashboard#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'webhooks/sendgrid_event', to: 'webhooks#sendgrid_event', as: :sendgrid_event
end
