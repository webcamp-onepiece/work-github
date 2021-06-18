class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.product_id = product.id
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to  cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to  cart_items_path
  end
  
  def destroy_all
  CartItems.destroy_all
  redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id)
  end
  
end
