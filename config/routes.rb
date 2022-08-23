Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
end
