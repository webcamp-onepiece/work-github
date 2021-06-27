class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10).reverse_order.where(is_active: "true")
  end
  
  def show
    # binding.pry
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end
  
end

