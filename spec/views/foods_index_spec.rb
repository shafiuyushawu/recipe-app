require 'rails_helper' 

RSpec.describe 'Food', type: :feature do 
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Shafiu', email: 'shafiu@mail.com', password: '123456')
      sign_in @user
      @food = Food.create(user: @user, name: 'Apple', measurement_unit: 'kg', quantity: 1, price: 100)
      visit root_path
    end
    it 'renders name of food' do
      expect(page).to have_content(@food.name)
    end

    it 'renders the  measurement unit of the page' do 
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'renders he price of the food' do 
      expect(page).to have_content(@food.price)
    end

    it 'should render a button add food ' do 
      expect(page).to have_content('Add Food')
    end

    it 'redirects to a form for new food' do 
      click_link 'Add Food'
      expect(page).to have_current_path(new_food_path)
    end
  end
end