class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10).reverse_order
  end
  
  def show
    # binding.pry
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end
  
end

