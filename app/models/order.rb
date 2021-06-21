class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy

  with_options presence: true do
    validates :customer_id
    validates :postage
    validates :total_price_tax
    validates :payment_method
    validates :receiver
    validates :receiver_postal_code
    validates :receiver_address
    validates :status
  end

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
end
