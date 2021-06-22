class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.product_id = product.id
    @cart_item.save
    redirect_to  public_cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_item.save
    redirect_to  public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to  public_cart_items_path
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
