require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query meal plan', type: :graphql do
  let(:query) do
    <<~GQL
      query getMealPlan($id: ID!) {
        getMealPlan(id: $id) {
          id
          recipes {
            id
            title
          }
        }
      }
    GQL
  end

  let(:user) do
    create(:user)
  end

  let(:recipes) do
    create_list(:recipe, 5, user_id: user.id)
  end

  let(:meal_day) do
    create(:meal_day, user_id: user.id)
  end

  let(:meal_type) do
    create(:meal_type)
  end

  let(:meal_plan) do
    create(:meal_plan, meal_type_id: meal_type.id, meal_day_id: meal_day.id, recipe_ids: recipes.pluck(:id))
  end

  it 'returns the correct id' do
    result = execute_graphql(
      query,
      variables: { id: meal_plan.id },
    )

    expect(result['data']['getMealPlan']['id']).to eq meal_plan.id.to_s
  end

  it 'returns the correct recipes' do
    result = execute_graphql(
      query,
      variables: { id: meal_plan.id },
    )

    expect(result['data']['getMealPlan']['recipes'].count).to eq recipes.count
  end
end
