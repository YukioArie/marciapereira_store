class AddOrderDetailToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :order_detail, null: true, foreign_key: true
  end
end
