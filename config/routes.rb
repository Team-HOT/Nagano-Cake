Rails.application.routes.draw do
  get 'cart/index'
  get 'cart/show'
   namespace :admin do
     resources :product_images, only: [:new, :create, :index, :show]
    resources :end_users, only:[:index, :show, :edit, :update]

  end
  namespace :admin do
    resources :product_categories, only:[:index, :new, :create, :edit, :update]
  end
  namespace :admin do
    resources :products
  end
  namespace :admin do
    resources :orders, only:[:index, :show, :update]
  end
  namespace :admin do
    get '/home', to:'home#top'
  end
  namespace :public do
    root :to => 'homes#top'
  resources :end_users do
        get 'withdraw', on: :member
        get 'delivery', on: :member
        delete 'destory_p', on: :member
    end
        get 'end_user/withdraw', to:'end_users#withdraw'
        get 'end_user/delivery', to:'end_users#delivery'
        delete 'end_user/destroy_p', to:'end_users#destory_p'

    resources :deliveries
<<<<<<< HEAD
    resources :orders do
      get 'detail', to: :member
    end
     get 'end_user/detail', to: 'end_users#detail'

    resources :cart_items

=======
    resources :orders

    resources :cart_items, only: [:index, :show, :create, :destroy, :update] do
      delete 'destroy_all', on: :member
    end
      delete 'cart_item_destroy_all', to:'cart_items#destroy_all'

  
>>>>>>> 5f2a0144b18b0b404313dffc2f2c3dfdd37b7e71
  end

  namespace :public do
    resources :product_categories, only:[:index, :create, :new, :show] 
    resources :products 
end
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
