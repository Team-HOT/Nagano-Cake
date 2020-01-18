Rails.application.routes.draw do
  namespace :admin do
    resources :order_items, only:[:index, :show, :update]
  end
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
    resources :order_items, only:[:index, :show, :update]
  end
  namespace :admin do
    get '/home', to:'home#top'
  end
  namespace :public do
    root :to => 'homes#top'
    get 'about', to:'homes#about'
  resources :end_users do
        get 'withdraw', on: :member
        get 'delivery', on: :member
        delete 'destory_p', on: :member
    end
        get 'end_user/withdraw', to:'end_users#withdraw'
        get 'end_user/delivery', to:'end_users#delivery'
        delete 'end_user/destroy_p', to:'end_users#destory_p'

    resources :deliveries

    resources :orders do
    get 'confirm',on: :collection
  end
  post 'oeders/confirm', to:'orders#confirm'

    resources :cart_items, only: [:index, :show, :create, :destroy, :update] do
      delete 'destroy_all', on: :member
    end
      delete 'cart_item_destroy_all', to:'cart_items#destroy_all'
  end

  namespace :public do
    resources :product_categories, only:[:index, :create, :new, :show]
    resources :products
end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
