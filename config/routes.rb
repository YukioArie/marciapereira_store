Rails.application.routes.draw do
  namespace :admins_area do
    get 'home', to: 'home#index'
    post 'cart/add_item', to: 'carts#add_item_in_cart'
    get 'search', to: 'search#products'
    resources :products
  end
  namespace :site do
    get 'home/index'
  end
  root to: 'site/home#index'
  get 'home/index'
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
