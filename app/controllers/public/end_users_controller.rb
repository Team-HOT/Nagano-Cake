class Public::EndUsersController < ApplicationController

 def show
 	 @end_user = EndUser.find(params[:id])
 end

 def edit
 	 @end_user = EndUser.find(params[:id])
 end
 def update
 	 @end_user = EndUser.find(params[:id])
 	 if @end_user.update(end_user_params)
 	 	redirect_to public_end_user_path(current_end_user.id)
 	 else
 	 	render :edit
 	 end
 end




 private
 def end_user_params
 	params.require(:end_user).permit(:email, :name1, :name2, :name3, :name4, :address, :post, :number, :withdraw)
 end
end