Rails.application.routes.draw do
  # Users routes
  post 'user_token' => 'user_token#create'
  
  post "/users" => "users#create"
  
  # Products routes
  get '/mini-capstone/:single_product' => 'products#find_single_product'

  get '/item_finder' => 'products#find_item'

  get '/products' => 'products#index'

  get '/product/:id' => 'products#show'

  post '/products' => 'products#create'

  patch '/product/:id' => 'products#show'

  patch '/products/:id' => 'products#update'

  delete '/products/:id' => 'products#destroy'

  post '/cartedproducts' => 'carted_products#create'

  get '/cartedproducts' => 'carted_products#index'

end
