class ApplicationController < ActionController::Base

# 管理者側 ログイン後のリダイレクト先
 def after_sign_in_path_for(resource)
 	case resource
 	when Admin
 	admin_home_path
 	end
 end

before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_out_path_for(resource)
	case resource
	when Admin
	 new_adimin_session_path

    else
    public_root_path
    end
 end

 def after_sign_in_path_for(resource)
    public_end_user_path(resource)
 end

 # def after_sign_out_path_for(resource)
 # 	public_root_path
 # end


protected
 def configure_permitted_parameters

   devise_parameter_sanitizer.permit(:sign_up, keys:[:name1, :name2, :name3, :name4, :post, :address, :number, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys:[:name1, :name2, :name3, :name4, :post, :address, :number, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:email])
 end
end