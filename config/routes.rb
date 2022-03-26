Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      devise_for :admins, controllers: {
        sessions: 'api/v1/admins/sessions',
        registrations: 'api/v1/admins/registrations'
      },
      defaults: {format: :json}
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
