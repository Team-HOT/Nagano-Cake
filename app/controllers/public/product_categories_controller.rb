class Public::ProductCategoriesController < ApplicationController
 def index
    @product_category = ProductCategory.new
    @product_categories = ProductCategory.all
 end


  def edit
  end

  def show
   @product = Product.find(params[:id])
   @product_categories = ProductCategory.all
   @product_category = ProductCategory.find(params[:id])
   # ケーキカテゴリーの商品
   # @product_categoryの商品
   @product_category.products
  end

  def update
  end

 private
  def product_category_params
     params.require(:product_category).permit(:product_category_name,  :product_category_id)
  end
end
