Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Namespace for API
  namespace :api do
    namespace :v1 do
      get "up" => "rails/health#show", as: :rails_health_check

      # Defines the root path route ("/")
      # root "posts#index"
      resources :checklist_templates do #
        resources :steps
      end
    end
  end
end
