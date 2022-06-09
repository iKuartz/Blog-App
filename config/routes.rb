Rails.application.routes.draw do    
  root "users#index"
  resources :users do
    resources :posts 
  end

  get '/users/:user_id/posts/:post_id/comment', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:post_id/comment', to: 'comments#create' #
  get '/users/:user_id/posts/:post_id/like', to: 'posts#show'
  post '/users/:user_id/posts/:post_id/like', to: 'likes#create', as: 'new_like'
 
end