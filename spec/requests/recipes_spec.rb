require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let!(:chef) { User.create(name: 'Tom') }
  let!(:valid_attributes) { { name: 'recipe 1', preparation_time: 40, cooking_time: 140,
    description: 'it is the most amazing recipe on the planet', public: true, user: chef } } 
    
  let!(:invalid_attributes) { { name: '', preparation_time: nil, cooking_time: nil,
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

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        expect { 
          post recipes_path, params: {recipe: valid_attributes}
        }.to change(Recipe, :count).by(1)
        expect(flash[:notice]).to eq('Recipe created successfully')
      end
    end
    context 'with invalid attributes' do
      it 'creates a new recipe' do
        post recipes_path, params: {recipe: invalid_attributes}
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Unable to create a recipe')
      end
    end
  end
end
