class Public::ProductCategoriesController < ApplicationController

  def new
  	@product_category = Product_category.new
  end

  def index
    @product_category = ProductCategory.new
    @product_categories = ProductCategory.all

  end
  def create
  	@product_category =  Product_category.new(product_params)
    @product_category.save
    redirect_to public_products_path
  end

  def edit
  end

  def show
    @product_category = Product_category.find(params[:id])
  end

  def update
  end

 private
 def product_category_params
     params.require(:product_category).permit(:product_category_name)
end



end
