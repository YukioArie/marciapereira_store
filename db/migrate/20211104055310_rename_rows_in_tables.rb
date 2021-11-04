class RenameRowsInTables < ActiveRecord::Migration[6.1]
  def up
    rename_column :products, :description, :title
    rename_column :products, :about, :description
    rename_column :brands, :description, :title
  end

  def down
    rename_column :products, :title, :description
    rename_column :products, :description, :about
    rename_column :brands, :title, :description
  end
end
