Rails.application.routes.draw do
  
  root to: 'home#top'
  get "home/about" => "home#about"
  
  devise_for :users
  resources :books, only:[:new, :index, :create, :show, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
