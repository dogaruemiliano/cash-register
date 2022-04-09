class ProductsController < ApplicationController
  def index
    @products = Product.all

    if session[:basket_id]
      @basket = Basket.find(session[:basket_id])
    else
      @basket = Basket.create!
      session[:basket_id] = @basket.id
    end
  end
end
