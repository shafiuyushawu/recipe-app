require 'rails_helper'

RSpec.describe 'Recipe index', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Nahom', email: 'nahom@mail.com', password: 123_456)
    sign_in @user
    @recipe = Recipe.create(user: @user, name: 'Jollof', preparation_time: 3, cooking_time: 2,
                            description: 'Prepard with stew', public: true)
    sign_out @user
    visit public_recipes_path
  end

  it 'should display the name of the recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'Displays the heading' do
    expect(page).to have_content('Public Recipes')
  end

  it 'Displays the Total Products' do
    expect(page).to have_content('Total')
  end

  it 'Displays the navbar content' do
    expect(page).to have_content('Recipe')
  end
end
