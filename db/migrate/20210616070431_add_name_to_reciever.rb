class AddNameToReciever < ActiveRecord::Migration[5.2]
  def change
    add_column :recievers, :name, :string
  end
end
