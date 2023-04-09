Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'ice_palaces#index'

  resources :users, only: %i[destroy show edit update]
  resources :ice_palaces, only: %i[index show] do
    resources :subscriptions, only: %i[create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
