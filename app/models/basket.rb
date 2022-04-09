class Basket < ApplicationRecord
  has_many :items, class_name: "BasketItem", dependent: :destroy

  def total_cost
    cost = 0
    items.each do |item|
      cost += item.total_cost
    end
    cost
  end
end
