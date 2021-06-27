class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # topページ
  def top
    @orders = Order.all.page(params[:page]).reverse_order
  end

end
