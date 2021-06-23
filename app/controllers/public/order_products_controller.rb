class Public::OrderProductsController < ApplicationController

  def update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.update(order_product_params)
		   flash[:success] = "製作ステータスを変更しました"
		   @order = Order.find(params[:id])
		   redirect_to admin_order_path(@order)
		else
		   render "orders/show"
		end
	end

	private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end


end
