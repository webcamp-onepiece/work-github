class AddPostalCodeToReciever < ActiveRecord::Migration[5.2]
  def change
    add_column :recievers, :postal_code, :string
  end
end
