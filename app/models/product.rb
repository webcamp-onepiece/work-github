class Product < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_products

  with_options presence: true do
  validates :name
  validates :description
  validates :price
  end

  validates :is_active, inclusion: { in: [true, false] }

end
