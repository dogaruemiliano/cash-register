class BasketItem < ApplicationRecord
  belongs_to :product
  belongs_to :basket
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_cost
   product.price * quantity
  end
end
