Rails.application.routes.draw do

  devise_for :users
   root to: "homes#top"
   get "homes/about", as: 'about'
   resources :books, only: [:create, :index, :edit, :show, :destroy, :update]
   resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
