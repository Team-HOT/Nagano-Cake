class Public::DeliveriesController < ApplicationController
 def new
 	@deliveries = Delivery.new
 end

 def index
 end


 def delivery_show
 	@delivery = Delivery.new
 	@deliveries = Delivery.find(params[:id])
 	@end_user = @deliveries.end_user

 end

 def edit
 	@delivery = Delivery.find(params[:id])
 end

 def update
 	@delivery = Delivery.find(params[:id])
 	if @delivery.update
 		redirect_to public_end_user_path(current_end_user.id)
 	else
 		render :edit
 	end
 end


 def create
 	@delivery = Delivery.new(delivery_params)
 	@delivery.end_user = current_end_user
 	if @delivery.save
 		redirect_to public_end_user_path(current_end_user.id)
 	else
 		@deliveries = Delivery.all
 		render :index
 	end
 end

 def destroy
 	if @deliveries = Delivery.find(params[:id])
 		@end_user = @deliveries.end_user
 		@end_user.destroy
 		redirect_to public_end_user_path(current_end_user.id)
 	else
 		render :delivery
 	end
 end


private
 def delivery_params
 	params.require(:delivery).permit(:end_user_id, :delivery_name1, :delivery_name2, :delivery_name3, :delivery_name4, :delivery_address, :delivery_post, :delivery_number, :payment)
 end
end

