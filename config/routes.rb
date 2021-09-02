Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]

  resources :posts

  resources :posts do
    resources :reviews, only: [:create, :destroy]
  end

  


  root 'posts#welcome'

  # # index
  # get '/posts' => 'posts#index', as: :posts

  # # new
  # get '/posts/new' => 'posts#new', as: :new_post
  # post '/posts' => 'posts#create'

  # # show
  # get '/posts/:id' => 'posts#show', as: :post 

  # # edit
  # get '/posts/:id/edit' => 'posts#edit', as: :edit_post

  # # patch
  # patch '/posts/:id' => 'posts#update'

  # # delete
  # delete '/posts/:id' => 'posts#destroy'

end
