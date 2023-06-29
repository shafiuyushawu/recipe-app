require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Nahom', email: 'nahom@mail.com', password: 123456)
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Jollof', preparation_time: 2, cooking_time: 1,
                              description: 'Ghanaian dish', public: true)
      visit recipes_path
    end

    it 'renders name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'renders description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'renders remove button' do
      expect(page).to have_content('REMOVE')
    end

    it 'redirects to delete path' do
      click_button 'REMOVE'
      expect(page).to have_current_path(recipes_path)
    end

    it 'renders a button to add recipe' do
      expect(page).to have_content('Add Recipe')
    end

    it 'redirects to a form for new recipe' do
      click_link 'Add recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end