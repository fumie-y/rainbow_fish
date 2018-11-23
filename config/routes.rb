Rails.application.routes.draw do
  get 'inquiry' => 'top_controller#inquiry'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'destroy' =>  'users#destroy_form'
  resources :users
  post 'users/:id/password_update' => 'users#password_update'
  get 'users/:id/likes_photos' => 'users#likes_photos'

  resources :photos
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
