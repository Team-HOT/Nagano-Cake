class Public::OrdersController < ApplicationController
    def create
    	@end_user = EndUser.find(params[:id])
    	@order = @end_user
     if @order.save 
     	redirect_to edit_public_order_path(@order.id)
    end
   end



    def edit
    	@end_user = EndUser.find(params[:id])
        @order = @end_user
    end
end


