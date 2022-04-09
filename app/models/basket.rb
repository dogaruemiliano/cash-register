class Basket < ApplicationRecord
  has_many :basket_items

  def total_cost
    cost = 0
    basket_items.each do |item|
      cost += item.total_cost
    end
    cost
  end
end
