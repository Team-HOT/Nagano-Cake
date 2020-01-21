class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


 def after_sign_out_path_for(resource)
  path = Rails.application.routes.recognize_path(request.referer)
  if path[:controller] == "admin/home"
    new_admin_session_path
  else
    public_root_path
  end
 end

 def after_sign_in_path_for(resource)
   case resource
   when Admin
        admin_home_path
   else
        public_product_categories_path
    end
 end

 def current_cart_item
  begin
   CartItem.find(session[:cart_item_id])
   rescue ActiveRecord::RecordNotFound
   cart_item = CartItem.crete
   session[:cart_item_id] = cart_item.id
   end
 end

 def log_out
  session.delete(end_user.id)
  @current_end_user = nil
 end

protected
 def configure_permitted_parameters

   devise_parameter_sanitizer.permit(:sign_up, keys:[:name1, :name2, :name3, :name4, :post, :address, :number, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys:[:name1, :name2, :name3, :name4, :post, :address, :number, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:email])
 end
end