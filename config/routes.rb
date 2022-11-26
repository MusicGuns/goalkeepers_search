Rails.application.routes.draw do
  devise_for :goalkeepers, controllers: { registrations: 'goalkeepers/registrations' }
  root to: 'ice_palaces#index'

  resources :goalkeepers, expect: %i[index]
  resources :ice_palaces, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
