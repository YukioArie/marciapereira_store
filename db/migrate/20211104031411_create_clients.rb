class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :genre
      t.string :email
      t.integer :cellphone_number

      t.timestamps
    end
  end
end
