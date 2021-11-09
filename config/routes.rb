Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :spot, only: [:new, :create, :show, :edit, :update, :destroy, :index, :indexProperty]
    resources :slots, only: [:new, :create, :update, :indexProperty]
    resources :chat_rooms, only: [:create, :show] do
        resources :messages, only: [:create]
    end
  end

  resources :chat_rooms, only: [:index]
  resources :slots, only: [:destroy, :edit]
end
