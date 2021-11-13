Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :slots, only: [:edit, :create, :new, :update]
    resources :bookings, only: [:create]
    resources :chat_rooms, only: [:create, :show] do
        resources :messages, only: [:create]
    end
  end

  resources :chat_rooms, only: [:index]
  resources :slots, only: [:destroy]
  resources :bookings, only: [:index, :destroy, :edit]
end
