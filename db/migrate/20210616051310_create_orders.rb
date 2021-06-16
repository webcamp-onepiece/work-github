class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :total_price_tax
      t.string :payment_method
      t.string :receiver
      t.string :receiver_postal_code
      t.string :receiver_address
      t.integer :status
      t.timestamps
    end
  end
end
