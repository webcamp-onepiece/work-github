class AddAddressToReciever < ActiveRecord::Migration[5.2]
  def change
    add_column :recievers, :address, :string
  end
end
