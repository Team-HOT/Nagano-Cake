class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
    @product_category = ProductCategory.all
    @products.each do |a|
      puts a.product_category.product_category_name
    end
  end

  def new
    @product = Product.new
    @product_category = ProductCategory.new
  end

  def create
    @product = Product.new(product_params)
    @product_category = ProductCategory.new
    if @product.save
       redirect_to admin_product_path(@product)
    else
       render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to admin_product_path(@product)
    else
       render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end


private
  def product_params
      params.require(:product).permit(:id, :name, :price, :product_body, :product_image, :product_category_id, :sale_status)
  end
end
