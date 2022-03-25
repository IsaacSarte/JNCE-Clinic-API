Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      devise_for :admins, defaults: { format: :json }, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :feedbacks
      end
    end
  end
end
