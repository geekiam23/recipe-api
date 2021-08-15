require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations updateMealPlanMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation updateMealPlan($mealPlanId: ID!, $recipeIds: [ID!]!) {
        updateMealPlanMutation(mealPlanId: $mealPlanId, recipeIds: $recipeIds) {
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

  let(:recipes) do
    create_list(:recipe, 5, user_id: user.id)
  end

  let(:meal_type) do
    create(:meal_type, id: 2)
  end

  let(:meal_plan) do
    meal_type
    create(:meal_plan, meal_day_id: meal_day.id)
  end 

  context 'when variables are valid' do
    it 'allows the user to successfully create a meal plan' do 
      result = execute_graphql(
        mutation,
        variables: { 
          mealPlanId: meal_plan.id,
          recipeIds: recipes.pluck(:id)
        },
      )

      expect(result['data']['updateMealPlanMutation']['mealPlan']['recipes'].count).to eq recipes.count
      expect(result['data']['updateMealPlanMutation']['success']).to eq true
      expect(result['data']['updateMealPlanMutation']['errors']).to eq []
    end
  end

  context 'when variables are invalid' do
    it 'returns an error message about mealPlanId' do
      result = execute_graphql(
        mutation,
        variables: {
          mealplanId: nil,
          recipeIds: recipes.pluck(:id)
        },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $mealPlanId of type ID! was provided invalid value"
    end

    it 'returns an error message about recipeIds' do
      result = execute_graphql(
        mutation,
        variables: {
          mealPlanId: meal_plan.id,
          recipeIds: nil
        },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $recipeIds of type [ID!]! was provided invalid value"
    end
  end
end
