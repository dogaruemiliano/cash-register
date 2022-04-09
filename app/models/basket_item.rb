class BasketItem < ApplicationRecord
  belongs_to :product
  belongs_to :basket
  validates :quantity, numericality: { greater_than: 0 }

  def total_cost
    discount = product.discount
    if quantity >= discount.min_quantity
      if discount.type_of_discount === 'percentage'
        (product.price * discount.percentage * quantity).round(2)
      elsif discount.type_of_discount === 'bonus'
        product.price * quantity
      end
    else
      product.price * quantity
    end
  end
end
