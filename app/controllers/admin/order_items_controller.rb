class Admin::OrderItemsController < ApplicationController

def update
	i = 0
	@order = Order.find(params[:id])
	# admin/orders/show.html.erbのehidden_fieldのパラメーター取得
	# params[:モデル名][:渡したname属性]で受け取る
	@order_item = OrderItem.find(params[:order_item][:order_item_id])
	# 上記で取得したレコードのproduction_statusを新しいものに入れ替える
	@order_item.update(production_status: params[:order_item][:production_status])
	if @order_item.production_status == "製作中"
	# production_statusが1つでも"製作中"になれば、order_statusも"製作中"に更新
		@order.update(order_status: "製作中")
	elsif @order_item.production_status == "製作完了"
			@order.order_items.each do |order_item|
				if order_item.production_status == "製作完了"
					i = i + 1
				end
			end
		# order_itemと"製作完了"の数が一緒になれば、order_statusが"発送準備中"になる
		if i == @order.order_items.length
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