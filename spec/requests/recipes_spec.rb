require 'rails_helper'
RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers
  let!(:chef) { User.create(name: 'Tom', email: 'shafiu@gamil.com', password: '123456') }

  before do
    sign_in chef
  end

  let!(:valid_attributes) do
    { name: 'recipe 1', preparation_time: 40, cooking_time: 140,
      description: 'it is the most amazing recipe on the planet', public: true, user: chef }
  end

  let!(:invalid_attributes) do
    { name: '', preparation_time: nil, cooking_time: nil,
      description: 'it is the most amazing recipe on the planet', public: true, user: chef }
  end

  describe 'GET /index' do
    it 'returns a successful response' do
      get recipes_path
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get recipes_path
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

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        expect do
          post recipes_path, params: { recipe: valid_attributes }
        end.to change(Recipe, :count).by(1)
        expect(flash[:notice]).to eq('Recipe created successfully')
      end
    end
    context 'with invalid attributes' do
      it 'creates a new recipe' do
        post recipes_path, params: { recipe: invalid_attributes }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Unable to create a recipe')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'delete a recipe' do
      recipe = Recipe.create! valid_attributes
      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(-1)
      expect([:notice]).to eq('Recipe successfully deleted')
    end
  end
end
