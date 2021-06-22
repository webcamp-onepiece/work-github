class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page]).reverse_order
    @products = Product.all
    
  end
  
  def show
    # binding.pry
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end
  
end

