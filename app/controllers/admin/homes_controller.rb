class Admin::HomesController < ApplicationController

  # topページ
  def top
    @orders = Order.all
  end

end
