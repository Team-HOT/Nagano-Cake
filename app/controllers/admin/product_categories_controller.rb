class Admin::ProductCategoriesController < ApplicationController


  def new
  	@product_category = ProductCategory.new
  end

  def index
  	@product_category = ProductCategory.all
  end

  def create
  	@product_category =  ProductCategory.new(product_params)
    @product_category.save
    redirect_to public_product_path
  end

  def edit
  end

  def update
  end
end



