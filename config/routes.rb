Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/google_key', to: 'google_keys#index'
      resources :users do
        resources :feedbacks
      end
    end
  end
end
