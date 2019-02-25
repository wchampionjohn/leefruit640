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
    member do
      post :add, path: 'add/:id/(:quantity)'
      get "checkout"
    end
  end
  resources :orders, only:[:new, :create]

  root "index#index"

  resources :products
  resources :articles
  resources :contracts, only:[:new, :create]

  get 'about/index'
  get 'note/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
