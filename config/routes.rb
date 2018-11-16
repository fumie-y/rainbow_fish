Rails.application.routes.draw do
  resources :photos

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'destroy' =>  'users#destroy_form'
  post 'users/:id/password_update' => 'users#password_update'
  resources :users
  get 'users/:id/likes_photos' => 'users#likes_photos'
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
