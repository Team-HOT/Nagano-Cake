class Public::EndUsersController < ApplicationController

 def show
 	 @end_user = EndUser.find(params[:id])
 end

 def edit
 	 @end_user = EndUser.find(params[:id])
 end





 private
 def end_user_params
 	params.require(:end_user).permit(:email, :name1, :name2, :name3, :name4, :address, :post, :number, :withdraw)
 end
end