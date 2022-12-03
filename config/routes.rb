Rails.application.routes.draw do
  devise_for :goalkeepers, controllers: { registrations: 'goalkeepers/registrations'}
  root to: 'ice_palaces#index'

  resources :goalkeepers, only: %i[destroy show edit update]
  resources :ice_palaces, only: %i[index show] do
    resources :subscriptions, only: %i[create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
