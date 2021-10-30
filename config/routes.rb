Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :spot, only: [:new, :create, :show, :edit, :update, :destroy, :index, :indexProperty]
  end

  resources :chatrooms, only: :show
end
