class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  with_options presence: true do
    validates :product_id
    validates :customer_id
    validates :count
  end
  
  def add_tax_price
    (self.price * 1.1).round
  end
  
end
