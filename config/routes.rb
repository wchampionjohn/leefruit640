Rails.application.routes.draw do
  devise_for(
    :users,
    controllers: {
      sessions: "user/sessions",
      registrations: "user/registrations"
    }
  )
  get 'products/show'

  get 'index/index'
  resource :cart, only:[:show, :destroy] do
    #member do
      #post "add", path:'add/:id'
      #get "checkout"
    #end
  end

  root "index#index"

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
