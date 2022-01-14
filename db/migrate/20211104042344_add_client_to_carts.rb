class AddClientToCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :client, null: false, foreign_key: true
  end
end
