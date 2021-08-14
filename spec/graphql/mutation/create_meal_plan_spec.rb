require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations createMealPlanMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation createMealPlan($mealDayId: ID!, $mealTypeId: ID!, $recipeIds: [ID!]!) {
        createMealPlanMutation(mealDayId: $mealDayId, mealTypeId: $mealTypeId, recipeIds: $recipeIds) {
          mealPlan {
            id
            recipes {
              id
              title
            }
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

  let(:meal_day) do
    create(:meal_day, user_id: user.id)
  end

  let(:meal_type) do
    create(:meal_type)
  end

  let(:recipes) do
    create_list(:recipe, 5, user_id: user.id)
  end

  context 'when variables are valid' do
    it 'allows the user to successfully create a meal plan' do
      result = execute_graphql(
        mutation,
        variables: { 
          mealDayId: meal_day.id,
          mealTypeId: meal_type.id,
          recipeIds: recipes.pluck(:id)
        },
      )

      expect(result['data']['createMealPlanMutation']['mealPlan']['recipes'].count).to eq recipes.count
      expect(result['data']['createMealPlanMutation']['success']).to eq true
      expect(result['data']['createMealPlanMutation']['errors']).to eq []
    end
  end

  context 'when variables are invalid' do
    it 'returns an error message about mealDayId' do
      result = execute_graphql(
        mutation,
        variables: {
          mealDayId: nil,
          mealTypeId: meal_type.id,
          recipeIds: recipes.pluck(:id)
        },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $mealDayId of type ID! was provided invalid value"
    end

    it 'returns an error message about recipeIds' do
      result = execute_graphql(
        mutation,
        variables: {
          mealDayId: meal_day.id,
          mealTypeId: meal_type.id,
          recipeIds: nil
        },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $recipeIds of type [ID!]! was provided invalid value"
    end

    it 'returns an error message about mealTypeId' do
      result = execute_graphql(
        mutation,
        variables: {
          mealDayId: meal_day.id,
          mealTypeId: nil,
          recipeIds: recipes.pluck(:id)
        },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $mealTypeId of type ID! was provided invalid value"
    end
  end
end
