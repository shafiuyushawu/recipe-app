require 'rails_helper'

RSpec.describe "Recipes", type: :request do
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
end
