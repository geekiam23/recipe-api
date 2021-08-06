require 'rails_helper'
require_relative '../support'

RSpec.describe 'query recipe', type: :graphql do
  let(:query) do
    <<~GQL
      query getRecipe($id: String!) {
        getRecipe(id: $id) {
          id
          title
          servings
          summary
          instructions
        }
      }
    GQL
  end

  it 'returns the correct id' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)
  
    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s },
    )

    expect(result['data']['getRecipe']['id']).to eq recipe.id.to_s
  end
  
  it 'returns the correct title' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)

    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s },
    )

    expect(result['data']['getRecipe']['title']).to eq recipe.title
  end

  it 'returns the correct servings' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)

    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s },
    )

    expect(result['data']['getRecipe']['servings']).to eq recipe.servings
  end

  it 'returns the correct summary' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)

    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s },
    )

    expect(result['data']['getRecipe']['summary']).to eq recipe.summary
  end

  it 'returns the correct instructions' do
    user = create(:user)
    recipe = create(:recipe, user_id: user.id)

    result = execute_graphql(
      query,
      variables: { id: recipe.id.to_s },
    )

    expect(result['data']['getRecipe']['instructions']).to eq recipe.instructions
  end
end
