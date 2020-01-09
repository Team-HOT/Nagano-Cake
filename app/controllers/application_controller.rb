class ApplicationController < ActionController::Base

# 管理者側 ログイン後のリダイレクト先
 def after_sign_in_path_for(resource)
 	case resource
 	when Admin
 	admin_home_path
 	end
 end
 # 管理者側 ログアウト後のリダイレクト先
 def after_sign_out_path_for(resource)
 	new_admin_session_path
 end
end