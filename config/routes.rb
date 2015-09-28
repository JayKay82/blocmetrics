Rails.application.routes.draw do
  # User routes
  devise_for :users
  resources :users, only: [:update]

  # Registered applications and events
  resources :registered_applications, except: [:edit, :update]

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#index', via: [:options]
    resources :events, only: [:create]
  end

  # Root paths
  authenticated :user do
    root to: 'registered_applications#index', as: 'authenticated_root'
  end
  root to: 'welcome#index'
end
