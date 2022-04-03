Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'api/v1/admins/sessions',
    registrations: 'api/v1/admins/registrations'
  },
  defaults: {format: :json}

  namespace :api do
    namespace :v1 do
      resources :services, only: [:index]
      resources :appointments, only: [:index, :show, :create]
      resources :logs, only: [:index, :show, :create]
      resources :users do
        resources :feedbacks
      end
      get '/admin/:id', to: 'admins#show'
      put '/admin/:id', to: 'admins#update'
      
    end
  end
end
