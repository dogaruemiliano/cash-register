class CreateBasketItems < ActiveRecord::Migration[6.1]
  def change
    create_table :basket_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
