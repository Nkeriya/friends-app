Rails.application.routes.draw do
  
  root 'home#index'

  devise_for :users, controllers: {registrations: :registrations }
  resources :users, only: [:index, :show]

  get '/search' => 'users#search', :as => 'search_page'

  resources :friendships, only: [:show, :create, :destroy]
  resources :friend_requests, only: [:show, :create, :destroy]

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end


  require 'sidekiq/web'
  MyApp::Application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/edit'
    mount Sidekiq::Web => "/sidekiq"  # mount Sidekiq::Web in your Rails app
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end