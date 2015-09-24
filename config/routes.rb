Rails.application.routes.draw do
  devise_for :users
  resources :user, only: [:update]
  root to: 'welcome#index'
end
