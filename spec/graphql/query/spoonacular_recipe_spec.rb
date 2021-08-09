require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query spoonacular recipe', type: :graphql do
  let(:query) do
    <<~GQL
      query getSpoonacularRecipe($spoonacularId: ID!, $userId: ID!) {
        getSpoonacularRecipe(spoonacularId: $spoonacularId, userId: $userId) {
          title
          servings
          summary
          instructions
        }
      }
    GQL
  end

  let(:user) do
    create(:user)
  end

  context 'when variable are valid' do
    let(:result) do
      execute_graphql(
        query,
        variables: { spoonacularId: '1', userId: user.id }
      )
    end

    before do 
      create(:recipe, user_id: user.id, spoonacular_id: 1)
    end

    it 'returns the correct title' do
      expect(result['data']['getSpoonacularRecipe']['title']).to eq 'Gumbo'
    end

    it 'returns the correct servings' do
      expect(result['data']['getSpoonacularRecipe']['servings']).to eq '20'
    end

    it 'returns the correct summary' do
      expect(result['data']['getSpoonacularRecipe']['summary']).to eq 'Best Recipe Ever' 
    end

    it 'returns the correct instructions' do
      expect(result['data']['getSpoonacularRecipe']['instructions']).to eq 'Have Fun!'
    end
  end

  context 'when spoonacularId are invalid' do
    let(:result) do
      execute_graphql(
        query,
        variables: { spoonacularId: nil, userId: user.id }
      )
    end

    it 'displays invalid spoonacularId message' do
      expect(result['errors'][0]['message']).to eq "Variable $spoonacularId of type ID! was provided invalid value"
    end
  end

  context 'when userId are invalid' do
    let(:result) do
      execute_graphql(
        query,
        variables: { spoonacularId: 1, userId: nil }
      )
    end

    it 'displays invalid spoonacularId message' do
      expect(result['errors'][0]['message']).to eq "Variable $userId of type ID! was provided invalid value"
    end
  end
end
