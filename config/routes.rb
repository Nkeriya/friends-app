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

  resources :post_likes, only: [:show, :create, :destroy]
  resources :comment_likes, only: [:show, :create, :destroy]
  get '/posts/:id/edit/delete/:image_id' => 'posts#delete_attachment', :as => 'delete_image'

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"  # mount Sidekiq::Web in your Rails app

  # MyApp::Application.routes.draw do
  # # get 'post_likes/create'
  # # get 'post_likes/destroy'
  # # get 'posts/index'
  # # get 'posts/show'
  # # get 'posts/edit'
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end