require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations createMealDayMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation createMealDay($userId: ID!, $day: String!) {
        createMealDayMutation(userId: $userId, day: $day) {
          mealDay {
            day
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

  context 'when variables are valid' do
    it 'allows the user to successfully create a meal day' do
      result = execute_graphql(
        mutation,
        variables: { userId: user.id, day: Date.today.to_s },
      )

      expect(result['data']['createMealDayMutation']['success']).to eq true
      expect(result['data']['createMealDayMutation']['errors']).to eq []
    end
  end

  context 'when variables are invalid' do
    it 'returns an error message about userId' do
      result = execute_graphql(
        mutation,
        variables: { userId: nil, day: Date.today },
      )
    
      expect(result['errors'][0]['message']).to eq "Variable $userId of type ID! was provided invalid value"
    end

    it 'returns an error message about day' do
      result = execute_graphql(
        mutation,
        variables: { userId: user.id, day: nil },
      )
  
      expect(result['errors'][0]['message']).to eq "Variable $day of type String! was provided invalid value"
    end
  end
end
