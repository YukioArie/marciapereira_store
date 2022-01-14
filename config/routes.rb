Rails.application.routes.draw do
  namespace :admins_area do
    get 'home', to: 'home#index'
    post 'cart/add_item', to: 'carts#add_item_in_cart'
    get 'cart', to: 'carts#index'
    patch 'cart/add/:cart_id/:item_id', to: 'carts#add_quantity_item', as: 'cart_add_quantity'
    patch 'cart/remove/:cart_id/:item_id', to: 'carts#remove_quantity_item', as: 'cart_remove_quantity'
    delete 'cart/delete/:cart_id/:item_id', to: 'carts#destroy_item', as: 'cart_destroy_item'
    get 'search', to: 'search#products'
    get 'order_details', to: 'order_details#index'
    post 'order_details/new/:cart_id', to: 'order_details#new', as: 'order_details_new'
    resources :clients
    resources :products
  end
  namespace :site do
    get 'home/index'
  end
  root to: 'admins_area/home#index'
  # root to: 'site/home#index'
  get 'home/index'
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
