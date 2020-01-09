class Admin::ProductsController < ApplicationController
  def index
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  def destroy
  end

private
def product_params
    params.require(:product).permit(:name, :price, :product_body, :product_image, :product_category_id, :sale_status)
end
end
