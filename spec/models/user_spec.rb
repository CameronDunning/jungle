require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'should save user info if all fields are enterred correctly' do
      user = User.create!({
        name: 'Name1',
        email: 'email@example.com',
        password_digest: 'test'
      })
      expect(User.where(name: 'Name1')).to exist
    end

    describe 'Invalid entries' do
      it 'should not save user info if name field is left blank' do
        # User.create!({
        #   email: 'email@example.com',
        #   password_digest: 'test'
        # })
        expect(User.create!({
          name: nil,
          email: 'email@example.com',
          password_digest: 'test'
        })).to raise_error
      end
    end
  end
end

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     cat = Category.find_or_create_by! name: 'Test1'
#     it 'should save successfully if all values are filled' do
#       cat.products.create!({
#         name: 'Name1',
#         price: 100,
#         quantity: 10
#       })
#       expect(Product.where(name: 'Name1')).to exist
#     end

#     describe 'Invalid entries' do
#       it 'should not save successfully if name value is not filled' do
#         expect{
#           cat.products.create!(name: nil, price: 100, quantity: 10)}.to raise_error("Validation failed: Name can't be blank")
#       end

#       it 'should not save successfully if price value is not filled' do
#         expect{
#           cat.products.create!(name: 'Name1', quantity: 10)}
#           .to raise_error("Validation failed: Price cents is not a number, Price is not a number, Price can't be blank")
#       end

#       it 'should not save successfully if quantity value is not filled' do
#         expect{
#           cat.products.create!(name: 'Name1', price: 100)}
#           .to raise_error("Validation failed: Quantity can't be blank")
#       end

#       it 'should not save successfully if category value is not filled' do
#         expect{
#           Product.create!(name: 'Name1', price: 100, quantity: 10, category_id: nil)}
#           .to raise_error("Validation failed: Category can't be blank")
#       end
#     end
#   end
# end
