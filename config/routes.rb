Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  namespace :admin do
    resources :authors
  end

  resources :users
  resources :books, only: [:index, :show]
  resources :categories
  resources :comments do
    member do
      get :new_reply
    end
  end
  resources :likes, except: :index
  resources :mark_books, only: [:create, :update]
  resources :favorites, only: [:create, :destroy]
end
