require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query meal day', type: :graphql do
  let(:query) do
    <<~GQL
      query getMealDay($id: ID!) {
        getMealDay(id: $id) {
          id
          day
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

  it 'returns the correct id' do
    result = execute_graphql(
      query,
      variables: { id: meal_day.id },
    )

    expect(result['data']['getMealDay']['id']).to eq meal_day.id.to_s
  end
  
  it 'returns the correct day' do
    result = execute_graphql(
      query,
      variables: { id: meal_day.id },
    )

    expect(result['data']['getMealDay']['day']).to eq "2021-08-12"
  end
end
