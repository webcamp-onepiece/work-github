class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page]).reverse_order
    @products = Product.all
    
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end

