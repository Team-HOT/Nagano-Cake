class Admin::ProductsController < ApplicationController
def index
     @products = Product.all

  end

  def new
    @product = Product.new
  end

  def create
          product = Product.new(product_params)
         product.save
        redirect_to admin_products_index_path
  end
  



  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def product_params
        params.require(:product).permit(:name, :price, :product_image)
    end
end
