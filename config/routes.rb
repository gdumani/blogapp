Rails.application.routes.draw do
  devise_for :users
  get 'likes/create/:id', to: 'likes#create', as: 'likes_create'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/posts/new', to: 'posts#new', as: 'post_new'
  post '/posts/new', to: 'posts#create', as: 'post_create'
  get '/comments/new/:id', to: 'comments#new', as: 'comments_new'
  post '/comments/create', to: 'comments#create', as: 'comment_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
