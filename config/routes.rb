Rails.application.routes.draw do
  devise_for(
    :users,
    controllers: {
      sessions: "user/sessions",
      registrations: "user/registrations",
      omniauth_callbacks: "user/omniauth_callbacks"
    }
  )
  get 'products/show'

  get 'index/index'
  resource :cart, only:[:show, :destroy] do
    member do
      post :add, path: 'add/:id/(:quantity)'
      post :update_quantity, path: 'update/:id'
      delete :remove, path: 'remove/:id'
      get "checkout"
    end
  end
  resources :orders, only:[:index, :new, :create, :show]

  resources :cities, only:[] do
    scope module: :cities do
      member do
        resources :areas, only:[:index]
      end
    end
  end

  root "index#index"

  resources :products
  resources :articles
  resources :contracts, only:[:new, :create]

  get 'about/index'
  get 'note/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
