class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
