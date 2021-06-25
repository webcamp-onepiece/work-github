class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
	end

	def update
	@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:success] = "注文ステータスを変更しました"
			# statusが入金確認だったら
			if @order.status == "入金確認"
				@order.order_products.each do |order_product|
					order_product.update(making_status: "製作待ち")
				end
			end
			redirect_to admin_order_path(@order)
		else
			render "show"
		end
	end

	private
  def order_params
    params.require(:order).permit(:status)
  end

end
