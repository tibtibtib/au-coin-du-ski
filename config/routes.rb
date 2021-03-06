Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :update, :edit, :create, :destroy] do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:show, :destroy] do
    member do
      get 'confirm'
    end
  end


  get 'pages/concept', to: 'pages#concept'
  get 'pages/my_bookings', to: 'pages#my_bookings'
  get 'pages/my_products', to: 'pages#my_products'
end
