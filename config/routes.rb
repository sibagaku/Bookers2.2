Rails.application.routes.draw do

  get 'chat/:id' => "chats#show", as: "chat"
  resources :chats, only:[:create]
  # get 'relationships/followings'
  # get 'relationships/followers'
  # get 'searches/search'
  # get 'book_comments/create'
  # get 'book_comments/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'
  root to: 'home#top'
  get "home/about" => "home#about"

  devise_for :users
  resources :books, only:[:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update] do
    resource :relationships, only:[:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
