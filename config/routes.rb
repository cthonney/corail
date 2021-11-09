Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :slots, only: [:new, :create, :edit, :update, :destroy, :indexProperty]
    resources :bookings, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :slots, only: [:destroy, :edit]
  resources :bookings, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
