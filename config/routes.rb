Rails.application.routes.draw do
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/update'
  end
  namespace :admin do
    get 'product_categories/index'
    get 'product_categories/create'
    get 'product_categories/edit'
    get 'product_categories/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    post'products/create'
    get 'products/show'
    get 'products/edit'
    patch 'products/update'
    delete 'products/destroy'
  end
  namespace :admin do
    get 'home/top'
  end
  
  namespace :public do
    root :to => 'homes#top'

    resources :products
  end





  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
