module ApplicationHelper
  # カート内商品
  def current_cart
    @cart_items = current_customer.cart_items
  end

  #税込計算
  def price_tax(price)
      (price * 1.1).round.floor
  end

  # カート用・小計の計算
  def subtotal(cart_item)
    price_tax(cart_item.product.price) * cart_item.count
  end

  # カート用・合計金額(送料抜き)の計算
  def sumtotal(cart_items)
    price = 0
    cart_items.each do |cart_item|
      price  +=  subtotal(cart_item)
    end
    return price
  end

  # 注文用・小計の計算
  def order_subtotal(order_product)
    order_product.price_tax * order_product.count
  end

  # 注文用・合計金額(送料抜き)の計算
    def order_sumtotal(order_products)
      price = 0
      order_products.each do |order_product|
      price  +=  order_subtotal(order_product)
    end
    return price
  end

  # 確定後・請求額の計算
  def order_total(order)
    order_sumtotal(order.order_products) + order.postage
  end
end
