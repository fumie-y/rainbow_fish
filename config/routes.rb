Rails.application.routes.draw do
  resources :users
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #TODO: homeコントローラーに入れるべきか新たにコントローラー作成するか保留中
  #get 'top_controller' =>
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
