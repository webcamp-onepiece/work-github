class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @product = Product.page(params[:page]).reverse_order
  end


  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def  show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を変更しました"
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :description,
       :genre_id, :price, :is_active)
  end

end
