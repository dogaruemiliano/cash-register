require 'rails_helper'

RSpec.describe Basket, type: :model do
  subject do
    p1 = Product.create!(product_code: 'GR1', name: 'Green Tea', price: 3.11)
    p2 = Product.create!(product_code: 'SR1', name: 'Strawberry', price: 5.00)
    p3 = Product.create!(product_code: 'CF1', name: 'Coffe', price: 11.23)

    sub = described_class.create!
  
    BasketItem.create(product: p1, basket: sub, amount: 1)
    BasketItem.create(product: p2, basket: sub, amount: 5)
    BasketItem.create(product: p3, basket: sub, amount: 8)
    
    sub
  end

  describe "Associations" do
    it { should have_many :basket_items}
  end

  describe 'Methods' do
    it 'shows the total price of the basket' do
      expect(subject.total_cost).to eq(117.95)
    end
  end
end
