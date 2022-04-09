require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  subject do
    product = Product.create!(product_code: 'SR1', name: 'Strawberry', price: 5.00)
    basket = Basket.create!
    described_class.create!(product: product, basket: basket)
  end
  
  describe 'Association' do
    it { should belong_to :basket }
    it { should belong_to :product }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is valid even without a quantity attribute (defaults to 1)' do
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
    it 'is not valid without an quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a neutral quantity' do
      subject.quantity = 0
      expect(subject).to_not be_valid
    end
    it 'is not valid with a negative quantity' do
      subject.quantity = -2
      expect(subject).to_not be_valid
    end

    describe "Methods" do
      it 'should return the total cost of products of this type' do
        subject.quantity = 2
        expect(subject.total_cost).to eq(10.00)
      end
    end
    
  end
end
