require 'rails_helper'

RSpec.describe Recipe, type: :request do
  describe 'GET recipes#index' do
    let(:content_type) { 'recipe' }
    let(:recipes) { described_class.render_all(content_type) }

    it 'renders recipes#index template' do
      get '/recipes'
      expect(response).to render_template :index
    end

    it 'expects to be array' do
      expect(recipes).to be_array
    end

    it 'displays all recipes' do
      expect(recipes.total).to eq 4
    end
  end

  describe 'GET recipes#show' do
    context 'when all fields are present' do
      let(:entry_id) { '437eO3ORCME46i02SeCW46' }
      let(:recipe) { described_class.render(entry_id) }

      before do
        recipe
      end

      it 'should render recipes#show template' do
        get "/recipes/#{recipe.id}"
        expect(response).to render_template :show
      end

      it 'returns the correct recipe' do
        expect(recipe.id).to eq entry_id
      end

      it 'returns the selected recipe fields' do
        expect(recipe.fields).to include :calories, :chef, :title, :description, :photo, :tags, :title
      end
    end

    context 'when tags or chef is not present' do
      let(:entry_id) { '5jy9hcMeEgQ4maKGqIOYW6' }
      let(:recipe) { described_class.render(entry_id) }

      it 'should render recipes#show template' do
        get "/recipes/#{recipe.id}"
        expect(response).to render_template :show
      end

      it 'returns all fields except tags and chef' do
        expect(recipe.fields).to_not include :tags, :chef
      end
    end
  end
end
