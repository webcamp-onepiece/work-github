class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage, default: 800
      t.integer :total_price_tax
      t.integer :payment_method
      t.string :receiver
      t.string :receiver_postal_code
      t.string :receiver_address
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
