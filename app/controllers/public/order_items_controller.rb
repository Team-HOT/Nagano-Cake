class OrderItemsController < ApplicationController
def show
	@oreder_item = OrderItems.find(params[:id])
end
