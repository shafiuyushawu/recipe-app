require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  chef = User.create(name: 'nahom')
  pizza = Food.create(name: 'pizza', measurement_unit: 'grams', price: 2.5, quantity: 4, user: chef)
  first_recipe = Recipe.create(name: 'recipe 1', preparation_time: 40, cooking_time: 140,
                               description: 'it is the most amazing recipe on the planet', public: true, user: chef)
  subject
  
  describe 'Validations' do
    it 'quantity should be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity should be numerical' do
      subject.quantity = 'hello'
      expect(subject).to_not be_valid
    end
    it 'quantity should be greater than or equal to 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
