class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  with_options presence: true do
    validates :product_id
    validates :customer_id
    validates :count
  end
end
