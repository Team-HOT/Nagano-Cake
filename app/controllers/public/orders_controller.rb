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



    # orderテーブルに保存するもの

    # order_itemテーブルに保存するもの
    # @item_product_neme = current_user.cart_items.product.name
    # @item_product_price = current_user.cart_items.product.price
    # @item_product_quantity = current_end_user.cart_item.quantity
    


end
def create
    current_end_user.cart_items.each do |items|
    @order = Order.new(order_params)
    @order_item = OrderItem.new
    @order_item = items.product.name
    @order_item = items.product.price
    @order_item = items.product
    
end

    @order.save!
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