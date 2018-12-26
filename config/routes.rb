Rails.application.routes.draw do
  get 'inquiry' => 'top#inquiry'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/:id/destroy_form' =>  'users#destroy_form'
  post 'users/:id/destroy' =>  'users#destroy'
  resources :users
  #post "users/:id/update" => "users#update"
  post 'users/:id/password_update' => 'users#password_update'
  get 'users/:id/likes_photos' => 'users#likes_photos'
  get 'users/:id/password_update' => 'users#password_update'
  # destroyは仮の画面作成
  get 'test_destroy' =>  'photos#test_destroy'

  resources :photos
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
