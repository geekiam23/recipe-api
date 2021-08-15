require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query recipes', type: :graphql do
  let(:query) do
    <<~GQL
      query recipes {
        recipes {
          id
          title
          servings
          summary
          instructions
        }
      }
    GQL
  end


  it 'returns the correct amount' do
    user = create(:user)
    recipe_list = create_list(:recipe, 25, user_id: user.id)

    result = execute_graphql(query)

    expect(result['data']['recipes'].length).to eq recipe_list.length
  end
end
