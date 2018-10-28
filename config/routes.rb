Rails.application.routes.draw do
 
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' =>  'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'users/:id/likes_photo' => 'users#likes_photo'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'login' => 'users#login_form'
  get 'users/destroy' => 'users#destroy'
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
