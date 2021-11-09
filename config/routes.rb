Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/delete'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :slots, only: [:new, :create, :edit, :update, :destroy, :indexProperty]
  end
  resources :slots, only: [:destroy, :edit]
end
