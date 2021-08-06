require 'rails_helper'
require_relative '../support'
require 'database_cleaner/active_record'

RSpec.describe 'query random recipe', type: :graphql do
  let(:query) do
    <<~GQL
      query getRandomRecipe($id: String!, $userId: String!) {
        getRandomRecipe(id: $id, userId: $userId) {
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

  let(:recipe) do
    create(:recipe, user_id: user.id, spoonacular_id: 1)
  end

  let(:result) do
    execute_graphql(
      query,
      variables: { id: recipe.id.to_s, userId: user.id.to_s }
    )
  end

  it 'returns the correct title' do
    binding.pry
    expect(result['data']['getRandomRecipe']['title']).to eq 'Gumbo'
  end

  it 'returns the correct servings' do
    binding.pry
    expect(result['data']['getRandomRecipe']['servings']).to eq '20'
  end

  it 'returns the correct summary' do
    expect(result['data']['getRandomRecipe']['summary']).to eq 'Best Recipe Ever' 
  end

  it 'returns the correct instructions' do
    expect(result['data']['getRandomRecipe']['instructions']).to eq 'Have Fun!'
  end
end
