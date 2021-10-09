Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: 'public/homes#top'
  get "/about" => 'public/homes#about'
  get "/admin" => 'admin/orders#top'

  namespace :public do
    patch "/customers/withdraw" => 'customers#withdraw'
    resources :customers, only: [:edit, :update]
    get "/customers/my_page" => 'customers#show'
    get "/customers/unsubscribe" => 'customers#unsubscribe'
    resources :items, only: [:index, :show]
    delete "/cart_items/destroy_all" => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    post "/orders/confirm" => 'orders#confirm'
    get "/orders/complete" => 'orders#complete'
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:show, :update]
    resources :order_detail, only: [:update]
  end
end
