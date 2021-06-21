class OrderProduct < ApplicationRecord
  belongs_to :order
  has_many :products

   with_options presence: true do
     validates :order_id
     validates :product_id
     validates :count
     validates :price_tax
     validates :making_status
   end
end
