Rails.application.routes.draw do
  root to: 'ice_palaces#index'
  
  resources :users, except: %i[destroy] do
    patch 'update_to_admin', on: :member
    get 'schedule', on: :member
    resources :ratings, only: %i[create]
  end
  resources :ice_palaces, only: %i[index show edit update destroy create new] do
    resources :sections, except: %i[index]
  end
  resource :session, only: %i[new create destroy]

  resources :adverts, only: %i[destroy edit update new create index]

  resources :subscriptions, only: %i[create destroy] do
    put :approve, on: :member
    put :unapprove, on: :member
  end
end
