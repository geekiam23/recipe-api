require 'rails_helper'
require 'support/spoonacular_response'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations deleteFavoriteMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation deleteFavorite($userId: ID!, $recipeId: ID!) {
        deleteRecipeFavoriteMutation(userId: $userId, recipeId: $recipeId) {
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

  # TODO: Rewrite test to include an array of recipes
  let(:recipe) do
    create(:recipe, id: 1, user_id: user.id,spoonacular_id: 1)
    # build_list(:recipe, 10) do |recipe, i|
    #   recipe.user_id = user.id
    #   recipe.user_id = user.id
    #   recipe.spoonacular_id = 200 + i
    # end
  end

	# let(:spoon_recipe) do
	# 	build_list(:recipe, 10) do |recipe, i|
	# 		recipe.spoonacular_id = i
	# 	end
  #   # JSON.parse(File.read('spec/factories/spoon_recipe.json'))
	# end

  context 'when variables are valid' do
    let :code do
      200
    end

    # before do
    #   byebug
    #   allow(Spoonacular::Recipe.new).to receive(:info).and_return(SpoonacularResponse.new(code, spoon_recipe))
    # end

    it 'allows the user to successfully delete a favorite for a recipe' do
      user.create_favorite_for(recipe['spoonacular_id'])
      # user.create_favorite_for(spoon_recipe[0]['id'])
      
      result = execute_graphql(
        mutation,
        variables: { userId: user.id, recipeId: recipe['spoonacular_id'] },
      )

      expect(result['data']['deleteRecipeFavoriteMutation']['success']).to eq true
      expect(result['data']['deleteRecipeFavoriteMutation']['errors']).to eq []
    end
  end

  context 'when variables are invalid' do
    it 'returns an error message about userId' do
      result = execute_graphql(
        mutation,
        variables: { userId: nil, recipeId: recipe['spoonacular_id'] },
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
