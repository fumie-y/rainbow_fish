Rails.application.routes.draw do
  post 'likes/:photo_id/create' => 'likes#create'
  delete 'likes/:photo_id/destroy' => 'likes#destroy'
  
  get 'inquiry' => 'top#inquiry'
  
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/:id/destroy_form' =>  'users#destroy_form'
  resources :users
  get 'users/:id/likes_photos' => 'users#likes_photos'
  resources :photos
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
