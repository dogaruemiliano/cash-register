require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  subject do
    product = Product.create!(product_code: 'SR1', name: 'Strawberry', price: 5.00)
    basket = Basket.create!
    described_class.create!(product: product, basket: basket, amount: 3)
  end
  
  describe 'Association' do
    it { should belong_to :basket }
    it { should belong_to :product }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a product' do
      subject.product = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without basket' do
      subject.basket = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a neutral amount' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
    it 'is not valid with a negative amount' do
      subject.amount = -2
      expect(subject).to_not be_valid
    end

    describe "Methods" do
      it 'should return the total cost of products of this type' do
        expect(subject.total_cost).to eq(15)
      end
    end
    
  end
end
