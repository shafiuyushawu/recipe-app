require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'show' do
    before(:each) do
      @user = User.create(name: 'Shafiu', email: 'shafiu@mail.com', password: 123_456)
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Jolof', preparation_time: 2, cooking_time: 1,
                              description: 'Ghanaian recipe', public: true)
      visit recipe_path(@recipe.id)
    end

    it 'renders name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'renders preparation time' do
      expect(page).to have_content(@recipe.preparation_time)
    end

    it 'renders cooking time' do
      expect(page).to have_content(@recipe.cooking_time)
    end

    it 'renders add ingredient button' do
      expect(page).to have_content('Add ingredient')
    end

    it 'redirects to add ingredient page' do
      click_link 'Add ingredient'
      expect(page).to have_current_path(new_recipe_ingredient_path(@recipe))
    end

    it 'renders shopping list button' do
      expect(page).to have_content('Generate shopping list')
    end
  end
end
