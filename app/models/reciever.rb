class Reciever < ApplicationRecord
    
    belongs_to :customer
    
    
  with_options presence: true do
   validates :customer_id
   validates :name
   validates :postal_code
   validates :address
  end
    
end
