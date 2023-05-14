Rails.application.routes.draw do
  root to: 'ice_palaces#index'
  
  resources :users, only: %i[destroy show edit update new create] do
    patch 'update_to_admin', on: :member
    get 'schedule', on: :member
  end
  resources :ice_palaces, only: %i[index show edit update] do
    resources :sections, except: %i[index]
  end
  resource :session, only: %i[new create destroy]

  resources :adverts, only: %i[destroy edit update new create index]

  resources :subscriptions, only: %i[create destroy] do
    put :approve, on: :member
    put :unapprove, on: :member
  end
end
