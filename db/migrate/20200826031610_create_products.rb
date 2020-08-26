class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :categorie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :brand
      t.integer :price

      t.timestamps
    end
  end
end
