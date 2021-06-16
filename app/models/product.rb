class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :order_products

  with_options presence: true do
  validates :name
  validates :description
  validates :price
  validates :is_active
  end

end
