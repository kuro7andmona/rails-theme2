Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get 'homes/about' => 'homes#about', as:"about"
  post 'books' => 'bookss#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy,:new]
  resources :users, only: [:index, :show, :edit, :update]
end