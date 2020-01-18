class Admin::OrderItemsController < ApplicationController
  def index
  	@order_items = OrderItem.all
  end

  def show
  end

  def update
  end

  def order_items_params
 	params.require(:order_item).permit(:order_id, :product_id, :order_item_price, :order_item_name, :production_status)
  end
end
