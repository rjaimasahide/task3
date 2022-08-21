Rails.application.routes.draw do

  devise_for :users
   root to: "home#top"
   get "home/about" => "home#about", as: 'about'
   resources :books, only: [:show, :edit, :index, :destroy, :update, :create]
   resources :users, only: [:show, :edit, :index, :update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
