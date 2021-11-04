class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
