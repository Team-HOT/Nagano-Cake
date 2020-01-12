Rails.application.routes.draw do
  namespace :admin do
    resources :end_users, only:[:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :product_categories, only:[:index, :create, :edit, :update]
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
    resources :orders
    resources :cart_items
  end


  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
