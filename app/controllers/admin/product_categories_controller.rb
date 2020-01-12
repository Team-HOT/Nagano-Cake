class Admin::ProductCategoriesController < ApplicationController
  def create
  	@product_category = ProductCategory.new(product_category_params)
    @product_category.save
    redirect_to admin_product_categories_path
  end

  def index
  	@product_category = ProductCategory.new
  	@product_categories = ProductCategory.all

  end

  def edit
  	@product_category = ProductCategory.find(params[:id])
  end

  def update
  	@product_category = ProductCategory.find(params[:id])
  	@product_category.update(product_category_params)
  	redirect_to admin_product_categories_path
  end

private
def product_category_params
    params.require(:product_category).permit(:id, :product_category_name)
end

end



