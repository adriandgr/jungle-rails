require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    let(:category) { Category.create! name: 'Test'}
    let(:product) {category.products.create!(
      name:  'Sample',
      description: 'fake description',
      quantity: 99,
      price: 9.99
    )}
    it 'should save correctly to db' do
      expect(product).to be_valid
    end
    it 'should validate presene of name' do
      product.name = nil
      expect {product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should validate presene of price' do
      product.price = '' #not sure why does not work with nil...
      expect {product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should validate presene of quantity' do
      product.quantity = nil
      expect {product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should validate presene of category' do
      product.category = nil
      expect {product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
