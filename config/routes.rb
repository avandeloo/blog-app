Rails.application.routes.draw do
  get '/' => 'articles#index'
  get '/articles' => 'articles#index'
  get '/articles/new' => 'articles#new'
  post '/articles' => 'articles#create'

  get '/articles/:id' => 'articles#show'
  get '/articles/:id/edit' => 'articles#edit'
  patch '/articles/:id' => 'articles#update'

  delete '/articles/:id' => 'articles#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get '/categories' => 'categories#index'
  get '/categories/new' => 'categories#new'
  post '/categories' => 'categories#create'

  get '/categories/:id' => 'categories#show'
  get '/categories/:id/edit' => 'categories#edit'
  patch '/categories/:id' => 'categories#update'

  delete '/categories/:id' => 'categories#destroy'

end
