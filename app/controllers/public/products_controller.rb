class Public::ProductsController < ApplicationController

 def new
    @product = Product.new
  end

def index
    @products = Product.all
    @product = Product.new
    @product_category = ProductCategory.all
  end

 def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end


 def show
 	@product = Product.find(params[:id])
 	@product_new = Product.new
 end



    private
def product_params
    params.require(:product).permit(:name, :price, :product_body, :product_image, :product_category_id, :sale_status)
end
end
