class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.text :about
      t.float :price
      t.boolean :available?, default: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end