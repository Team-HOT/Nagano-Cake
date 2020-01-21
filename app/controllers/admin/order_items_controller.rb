class Admin::OrderItemsController < ApplicationController

def update
	@order = Order.find(params[:id])
	@order_item = @order.order_items
	@order_item.update(production_status: params[:order_item][:production_status])
	@order.order_items.each do |order_item|
		if order_item.production_status == "製作中"
			@order.update(order_status: "製作中")
		elsif order_item.production_status == "製作完了"
			  @order.update(order_status: "発送準備中")
		end
	end
	redirect_to admin_order_path(@order)
end

 private
  def order_params
  	params.require(:order).permit(:postage, :order_status, :quantity, :end_user_id, :delively_id, :payment, :delivery_name, :Delivery_address, :Delivery_post)
  end
   def order_item_params
 	params.require(:order_item).permit(:order_id, :product_id, :order_item_price, :order_item_name, :production_status, :quantity)
  end

end