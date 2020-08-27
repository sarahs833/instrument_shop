class AddColumnToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :condition, :string
    add_column :products, :description, :string
  end
end
