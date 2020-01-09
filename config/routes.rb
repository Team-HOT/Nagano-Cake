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






  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
