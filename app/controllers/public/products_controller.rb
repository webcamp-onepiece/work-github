class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page]).reverse_order
    @products = Product.where(is_active: "true")
  end
  
  def show
    # binding.pry
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end
  
end

