Rails.application.routes.draw do
  namespace :api do
    devise_for :users

    resources :users, only: [ :show ] do
      resources :checklist_templates do
        member do
          post :share
          post :add_location
          post :add_image
        end
        resources :steps, except: [ :show ]
      end
      resources :checklist_instances, only: [ :index, :show, :create ] do
        member do
          patch :complete
        end
        resources :step_instances, only: [ :update ] do
          member do
            patch :add_note
            patch :add_photo
          end
        end
      end
      root to: "pages#home"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
