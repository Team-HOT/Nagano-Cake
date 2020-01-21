class Public::OrderItemsController < ApplicationController
def show
	@order_items = OrderItem.find(params[:id])

end

def index
end
end