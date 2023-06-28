require 'rails_helper'

RSpec.describe "ShoppingLists", type: :request do
  describe "GET /index" do
    it 'returns a successful response' do 
      get shopping_list_index_path
      expect(response).to be_successful
    end

    it 'renders the accurate template' do 
      get shopping_list_index_path 
      expect(response).to render_template(:index)
    end
  end
end
