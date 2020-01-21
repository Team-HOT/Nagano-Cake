class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @delivery = current_end_user.deliveries
        @e = current_end_user
        @b = @e.post + @e.address + @e.name1 + @e.name2

        @a = []
        @delivery.each do |d|

            b = d.delivery_post
            c = d.delivery_address
            e = d.delivery_name1
            @a << [b + c + e]
        end

# p @a

end
def show
    @order = Order.find(params[:id])
    @orders = @order.order_items

end

def detail
    @order_item = OrderItem.find(params[:id])


end

def confirm
    @t = Delivery.new
    @delivery = current_end_user.deliveries
    @e = current_end_user
    @b = @e.post + @e.address + @e.name1 + @e.name2

    @a = []
    @delivery.each do |d|

        b = d.delivery_post
        c = d.delivery_address
        e = d.delivery_name1
        @a << [b + c + e]
    end

    if params[:Delivery_info] == "1"
        @order_delivery = @b

    elsif params[:Delivery_info] == "2"
        @order_delivery = params[:order][:Delivery_address]

    elsif params[:Delivery_info] == "3"
        @dp = params[:order][:Delivery_post]
        @da = params[:order][:Delivery_address]
        @dn = params[:order][:delivery_name]

        @order_delivery = @dp.to_s + @da + @dn





    end
    @cart_items = current_end_user.cart_items
    @postage = 800
    @payment = params[:order][:payment]
    @order = Order.new(order_params)
    @order_item = OrderItem.new


end
def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id

# 空箱作成
if @order.save!
    current_end_user.cart_items.each do |items|

        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.order_item_name = items.product.name
        @order_item.order_item_price = items.product.price
        @order_item.product_id = items.product_id
        @order_item.quantity = items.quentity
        @order_item.save!
    end
    current_end_user.cart_items.destroy_all

    redirect_to public_thanks_path
else
    render :confirm
end
end

def edit
    @order = Order.find(params[:id])
end
def index
    @end_user = current_end_user
    @orders = Order.all
end



private
def order_params
    params.require(:order).permit(:postage, :order_status, :quantity, :total_fee, :end_user_id, :delivery_id, :Delivery_address, :Delivery_post, :delivery_name, :payment)
end

end