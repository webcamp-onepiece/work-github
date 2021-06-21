class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @receiver = Receiver.where(customer_id: current_customer)
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(customer_id: current_customer, payment_method: params[:order][:payment_method])
  end
  
  def thankyou
  end

  private

  def order_params
    params.require(:order).permit(:receiver, :receiver_postal_code, :receiver_address, :payment_method, :total_price_tax)
  end

  def receiver_params
    params.require(:order).permit(:receiver, :receiver_postal_code, :receiver_address)
  end

end
