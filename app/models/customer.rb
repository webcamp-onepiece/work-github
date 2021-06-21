class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items,dependent: :destroy
  has_many :orders
  has_many :recievers   
         

  with_options presence: true do
   validates :family_name
   validates :first_name
   validates :family_name_kana
   validates :first_name_kana
   validates :postal_code
   validates :address
   validates :phone_number
   validates :email
   validates :encrypted_password
  end
         
end
