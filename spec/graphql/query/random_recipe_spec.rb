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

  it 'returns the correct title' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id, spoonacular_id: 1)
    
    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s, userId: user.id.to_s }
    )

    expect(result['data']['getRandomRecipe']['title']).to eq 'Gumbo'
    expect(result['data']['getRandomRecipe']['servings']).to eq '20'
    expect(result['data']['getRandomRecipe']['summary']).to eq 'Best Recipe Ever' 
    expect(result['data']['getRandomRecipe']['instructions']).to eq 'Have Fun!'
  end
end
