class Public::CartItemsController < ApplicationController
	def index
		@end_user = current_end_user
		@product_item = @end_user.cart_items
	end


	def create
		@cart_item = current_end_user.cart_items.new(cart_item_params)
		@cart_item.save
		redirect_to public_cart_items_path(@product)
	end


	def update
		@product = CartItem.find(params[:id])
		@product.update(cart_item_params)
		redirect_to public_cart_items_path(@product)
	end

	def destroy
		@product = CartItem.find(params[:id])

		@product.destroy
		redirect_to public_cart_items_path
	end

	def destroy_all
		@end_user = current_end_user
		@product = @end_user.cart_items
		@product.destroy_all
		redirect_to public_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:end_user_id, :product_id, :quentity)

	end
end