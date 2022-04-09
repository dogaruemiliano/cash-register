class BasketItemsController < ApplicationController
  before_action :set_basket_and_product

  def add
    basket_item = @basket.items.find_by(product: @product)

    if basket_item
      basket_item.quantity += 1
      basket_item.save!
    else
      BasketItem.create(product: @product, basket: @basket)
    end

    redirect_to root_path
  end

  def remove
    basket_item = @basket.items.find_by(product: @product)
    basket_item.quantity -= 1

    if basket_item.quantity.zero?
      basket_item.destroy!
    else
      basket_item.save
    end

    redirect_to root_path
  end

  private

  def set_basket_and_product
    @basket = Basket.find(params[:basket_id])
    @product = Product.find(params[:product_id])
  end
end
