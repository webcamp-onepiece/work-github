class Public::OrdersController < ApplicationController
  # ログインユーザーのみ可能
  before_action :authenticate_customer!
  # 自作ヘルパーの呼び出し
  include ApplicationHelper

  def new
    @order = Order.new
    @receiver_addresses = Receiver.where(customer_id: current_customer)
    @new_address = Receiver.new(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = current_cart
    @order = Order.new(customer_id: current_customer, payment_method: params[:order][:payment_method])

    #請求額(total_price_tax)
    @order.total_price_tax = sumtotal(@cart_items) + @order.postage

    # receiverがcurrent_addressの場合
    if params[:order][:receiver] == "current_address"
      @order.receiver = current_customer.family_name + current_customer.first_name
      @order.receiver_postal_code = current_customer.postal_code
      @order.receiver_address = current_customer.address

    # receiverがreceiver_addressesの場合
    elsif params[:order][:receiver] == "receiver_addresses"
      receiver = Receiver.find(params[:order][:receiver_id])
      @order.receiver = receiver.name
      @order.receiver_postal_code = receiver.postal_code
      @order.receiver_address = receiver.address

    # receiverがnew_addressの場合
    elsif params[:order][:receiver] == "new_address"
      @order.receiver        = params[:receiver][:name]
      @order.receiver_postal_code = params[:receiver][:postal_code]
      @order.receiver_address     = params[:receiver][:address]
      @order.customer = current_customer
      @existence = "1"

      # バリデーションエラー
      unless @order.valid? == true
        @receiver_addresses = Receiver.where(customer: current_customer)
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
      @receiver = Receiver.new
      @receiver.customer_id = current_customer.id
      @receiver.name = receiver_params[:receiver]
      @receiver.postal_code = receiver_params[:receiver_postal_code]
      @receiver.address = receiver_params[:receiver_address]
      @receiver.save
    end

    # カート商品(CartItem)を注文商品(OrderProduct)にコピー
    @cart_items = current_cart
    @cart_items.each do |cart_item|
      OrderProduct.create(
        order_id: @order.id,
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