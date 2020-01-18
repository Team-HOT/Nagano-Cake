class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @delivery = current_end_user.deliveries
        @e = current_end_user
        @b = @e.post + @e.address + @e.name1 + @e.name2

        # @a = []
        # @delivery.each do |d|
        #     a = d.id
        #     b = d.delivery_post
        #     c = d.delivery_address
        #     e = d.delivery_name1
        #     @a << [b + c + e, a]

# p @a

end
def show
    @order_items = OrderItem.find(params[:id])
end

def confirm
    @cart_items = current_end_user.cart_items
    @postage = 800
    @order_delivery = params[:order][:Delivery_address]
    @payment = params[:order][:payment]
    @order = Order.new(order_params)
    @order_item = OrderItem.new


end
def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    # 空箱作成
    @order.save!
    @order_item = OrderItem.new
    @order_item.order_id = @order.id
    current_end_user.cart_items.each do |items|
      @order_item.order_item_name = items.product.name
      @order_item.order_item_price = items.product.price
      @order_item.product_id = items.product_id
    end

    @order_item.save!
    redirect_to public_orders_path

end


def edit
    @order = Order.find(params[:id])
end



private
def order_params
    params.require(:order).permit(:postage, :order_status, :quantity, :total_fee, :end_user_id, :delivery_id, :Delivery_address, :Delivery_post, :delivery_name, :payment)
end

end