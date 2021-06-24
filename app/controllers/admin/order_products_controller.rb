class Admin::OrderProductsController < ApplicationController
	before_action :authenticate_admin!

	def update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.update(order_product_params)
			flash[:success] = "製作ステータスを変更しました"

			# making_statusが製作中だった場合
			if @order_product.making_status == "製作中"
				@order = Order.find(@order_product.order.id)
				@order.update(status: "製作中")
			# making_statusが製作完了だった場合
			elsif @order_product.making_status == "製作完了"
				@order = Order.find(@order_product.order.id)
					if @order.order_products.where(making_status: "製作完了").count == @order.order_products.count
							@order.update(status: "発送準備中")
					end
			end
		   redirect_to admin_order_path(@order_product.order_id)
		else
		   render "orders/show"
		end
	end

	private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

end
