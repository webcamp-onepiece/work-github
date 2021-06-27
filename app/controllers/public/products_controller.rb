class Public::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).where(is_active: "true")
  end
  
  def show
    # binding.pry
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end
  
end

