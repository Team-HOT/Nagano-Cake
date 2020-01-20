class Admin::OrdersController < ApplicationController
  def index
  	@order = Order.all
  	@orders = Order.created_today
  end

def show
	@order = Order.find(params[:id])
	@order_items = OrderItem.all
	@postage = 800
end

def personal_order
	@orders = Order.all
	@end_user = EndUser.find(params[:id])
end

 private
  def order_params
  	params.require(:order).permit(:postage, :order_status, :quantity, :end_user_id, :delively_id, :payment, :delivery_name, :Delivery_address, :Delivery_post)
  end
   def order_item_params
 	params.require(:order_item).permit(:order_id, :product_id, :order_item_price, :order_item_name, :production_status, :quantity)
  end
end