Rails.application.routes.draw do
  root to: 'ice_palaces#index'
  
  resources :users, only: %i[destroy show edit update new create] do
    patch 'update_to_admin', on: :member
  end
  resources :ice_palaces, only: %i[index show edit update] do
    resources :subscriptions, only: %i[create destroy]
    resources :sections, except: %i[index]
  end
  resource :session, only: %i[new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
