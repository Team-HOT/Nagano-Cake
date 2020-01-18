class Public::ProductsController < ApplicationController
 def index
 	@product = Product.all
 end
 def category_show
 	@product = Product.find(params[:id])
 	@product_categories = ProductCategory.find(params[:id])

 end


 def show
 	@product = Product.find(params[:id])
 	@product_new = Product.new
 	@product_categories = ProductCategory.all
 	@cart_item = CartItem.new
 end






 private
 def product_params
    params.require(:product).permit(:name, :price, :product_body, :product_image, :product_category_id, :sale_status)
 end
 def product_category
	params.require(:product_category).permit(:name)
 end
end


