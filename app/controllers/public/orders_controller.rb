class Public::OrdersController < ApplicationController
  # 自作ヘルパーの呼び出し
  include ApplicationHelper

  def new
    @order = Order.new
    @receiver = Receiver.where(customer_id: current_customer)
  end

  def confirm
    @cart_items = current_cart
    @order = Order.new(customer_id: current_customer, payment_method: params[:order][:payment_method])

    #請求額(total_price_tax)
    @order.total_price_tax = total(@order)

    # addressがcurrent_addressの場合
    if params[:order][:addresses] == "current_address"
      @order.receiver = current_customer.family_name + current_customer.first_name
      @order.receiver_postal_code = current_customer.residence
      @order.receiver_address = current_customer.postal_code


    # addressがreceiver_addressesの場合
    elsif params[:order][:addresses] == "receiver_addresses"
      receiver = Receiver.find(params[:order][:receiver_id])
      @order.receiver = receiver.name
      @order.receiver_postal_code = receiver.postal_code
      @order.receiver_address = receiver.address

    # addressがnew_addressの場合
    elsif params[:order][:addresses] == "new_address"
      @order.receiver        = params[:order][:name]
      @order.receiver_postal_code = params[:order][:postal_code]
      @order.receiver_address     = params[:order][:address]
      @existence = "1"

    # バリデーションエラー
    unless @order.valid? == true
      @receiver = Receiver.where(customer: current_customer)
      render :new
    end
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    # flash[:notice] = "ご注文が確定しました。"
    redirect_to thankyou_orders_path

    # 配送先がnew_addressの場合、Receiverに新規保存
    if params[:order][:existence] == "1"
      current_customer.receiver.create(address_params)
    end

    # カート商品(CartItem)を注文商品(OrderProduct)にコピー
    @cart_items = current_cart
    @cart_items.each do |cart_item|
    OrderProduct.create(
      order_id: @order_id,
      product_id: cart_item.product_id,
      count: cart_item.count,
      price_tax: subtotal(cart_item)
    )
    end
    # カート商品を空にする
    @cart_items.destroy_all
	end

  def thankyou
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
	end

	def show
	  @order = Order.find(params[:id])
    @order_products = @order.order_products
	end

  private

  def order_params
    params.require(:order).permit(:receiver, :receiver_postal_code, :receiver_address, :payment_method, :total_price_tax)
  end

  def receiver_params
    params.require(:order).permit(:receiver, :receiver_postal_code, :receiver_address)
  end
end
