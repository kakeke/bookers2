Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :roots, only: [:index]
  resources :abouts, only: [:index]
  root 'top#index'
end