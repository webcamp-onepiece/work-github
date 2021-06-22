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

  validates :receiver_postal_code, numericality: true

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
end
