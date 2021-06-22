class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

   with_options presence: true do
     validates :order_id
     validates :product_id
     validates :count
     validates :price_tax
     validates :making_status
   end

   enum status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }
end
