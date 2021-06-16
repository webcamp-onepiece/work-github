class AddCustomerIdToReciever < ActiveRecord::Migration[5.2]
  def change
    add_column :recievers, :customer_id, :integer
  end
end
