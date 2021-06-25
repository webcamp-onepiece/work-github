class Receiver < ApplicationRecord

  belongs_to :customer

  with_options presence: true do
  validates :customer_id
  validates :name
  validates :postal_code
  validates :address
  end

  # 郵便番号と住所を連結して表示
  def postal_code_address
    "〒" + self.postal_code.to_s + " " + self.address +  " " + self.name
  end
end
