YoungLiving::Application.routes.draw do
  resources :products, only: [ :index, :show ]
  resources :categories, only: [ :index, :show ]
  root :to => 'application#index'
end
