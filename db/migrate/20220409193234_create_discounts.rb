class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :type_of_discount
      t.float :percentage, precision: 2 
      t.integer :min_quantity
      t.references :product, null: false, foreign_key: true
      t.integer :bonus

      t.timestamps
    end
  end
end
