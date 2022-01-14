class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.float :total_price

      t.timestamps
    end
  end
end
