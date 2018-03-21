Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/blogs' => 'blogs#index'
  # get '/blogs/new' => 'blogs#new'
  # post '/blogs' => 'blogs#create'
  # get '/blogs/:id' => 'blogs#show' , as:'blog'
  # get '/blogs/:id/edit' => 'blogs#edit', as:'edit_blog'
  # routes.rbで定義したルーティングはターミナルでrake routesと打つと確認できる
  # delete '/blogs/:id' => 'blogs#destroy', as: 'destroy_blog'
  root "blogs#index"
  resources :blogs
end