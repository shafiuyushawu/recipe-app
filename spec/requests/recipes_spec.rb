require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let!(:chef) { User.create(name: 'Tom') }
  let!(:valid_attributes) { { name: 'recipe 1', preparation_time: 40, cooking_time: 140,
    description: 'it is the most amazing recipe on the planet', public: true, user: chef } }
  describe "GET /index" do
    it 'returns a successful response' do
      get recipes_url
      expect(response).to be_successful
    end
    
    it 'renders a correct template' do
      get recipes_url
      expect(response).to render_template('index')
    end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      recipe = Recipe.create! valid_attributes
      get recipe_url(recipe)
      expect(response).to be_successful
    end

    it 'renders a correct template' do
      recipe = Recipe.create! valid_attributes
      get recipe_url(recipe)
      expect(response).to render_template('show')
    end
  end
  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_url
      expect(response).to be_successful
    end

    it 'renders a correct template' do
      get new_recipe_url
      expect(response).to render_template('new')
    end
  end
end
