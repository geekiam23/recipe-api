require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations createFavoriteMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation createFavorite($userId: ID!, $recipeId: ID!) {
        createRecipeFavoriteMutation(userId: $userId, recipeId: $recipeId) {
          recipe {
            title
          }
          success
          errors {
            message
          }
        }
      }
    GQL
  end

  let(:user) do
    create(:user)
  end

  let(:recipe) do
    create(:recipe, user_id: user.id)
  end


  context 'when variables are valid' do
    it 'allows the user to successfully favorite a recipe' do
      result = execute_graphql(
        mutation,
        variables: { userId: user.id, recipeId: recipe.id },
      )

      expect(result['data']['createRecipeFavoriteMutation']['success']).to eq true
      expect(result['data']['createRecipeFavoriteMutation']['errors']).to eq []
    end
  end

  context 'when variables are invalid' do
    it 'returns an error message about userId' do
      result = execute_graphql(
        mutation,
        variables: { userId: nil, recipeId: recipe.id },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $userId of type ID! was provided invalid value"
    end

    it 'returns an error message about recipeId' do
      result = execute_graphql(
        mutation,
        variables: { userId: user.id, recipeId: nil },
      )
  
      expect(result['errors'][0]['message']).to eq "Variable $recipeId of type ID! was provided invalid value"
    end
  end
end
