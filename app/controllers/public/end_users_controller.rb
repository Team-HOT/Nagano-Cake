class Public::EndUsersController < ApplicationController

 def show
 	@end_user = EndUser.find(params[:id])
 	@product = ProductCategory.find(params[:id])
 end

 def edit
 	@end_user = EndUser.find(params[:id])
 end

 def delivery_edit
 	@end_user = EndUser.find(params[:id])
 	@deliveries = @end_user.deliveries
 end

 def delivery_update
 	@delivery = Delivery.find(params[:id])
 	if @delivery.update
 		redirect_to public_end_user_path(current_end_user.id)
 	else
 		render :delivery_edit
 	end
 end

 def update
 	 @end_user = EndUser.find(params[:id])
 	 if @end_user.update(end_user_params)
 	 	redirect_to public_end_user_path(current_end_user.id)
 	 else
 	 	render :edit
 	 end
 end

 def destroy
 	@delivery = Delivery.find(params[:id])
 	if @delivery.destroy
 	   redirect_to public_end_user_path(current_end_user.id)
 	else
 	   render :show
 	end
 end

 def destory_p
 	@end_user = EndUser.find(params[:id])
 	@end_user.destroy
 	redirect_to public_root_path
 end


 def withdraw

 end

 def delivery
 	@end_user = EndUser.find(params[:id])
 	@deliveries = @end_user.deliveries
 	@delivery = Delivery.new
 end

 def create
 	@end_user = EndUser.find(params[:id])
 	@deliveries = @end_user.deliveries
    if @deliveries.save!
 	reirect_to public_end_user_path(current_end_user.id)
    else
 	render :show
    end
 end


 private
 def end_user_params
 	params.require(:end_user).permit(:email, :name1, :name2, :name3, :name4, :address, :post, :number, :withdraw)
 end
end