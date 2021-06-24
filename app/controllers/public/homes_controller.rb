class Public::HomesController < ApplicationController
  def top
    @products = Product.where(is_active: "true")  
    @new_products = @products.limit(4).order(" created_at DESC ")
  end

  def about
  end
end
