class CreateRecievers < ActiveRecord::Migration[5.2]
  def change
    create_table :recievers do |t|

      t.timestamps
    end
  end
end
