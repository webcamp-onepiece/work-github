module ApplicationHelper
  # カート内商品
  def current_cart
    @cart_items = current_customer.cart_items
  end

  #税込計算
  def price_tax(price)
      (price * 1.1).round.floor
  end

  # 小計の計算
  def subtotal(cart_item)
    price_tax(cart_item.product.price) * cart_item.count
  end

  # 合計金額(送料抜き)の計算
  def sumtotal(cart_items)
    price = 0
    cart_items.each do |cart_item|
      price  +=  subtotal(cart_item)
    end
    return price
  end

  # 請求額の計算
  def total(order)
    sumtotal(order.order_products) + order.postage
  end
end
