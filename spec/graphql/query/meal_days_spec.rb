require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query meal days', type: :graphql do
  let(:query) do
    <<~GQL
      query getMealDays {
        getMealDays {
          id
          day
        }
      }
    GQL
  end
  
  it 'returns the correct id' do
    user = create(:user)
    create_list(:meal_day, 10, user_id: user.id)
    result = execute_graphql(query)

    expect(result['data']['getMealDays'].count).to eq 10
  end
end
