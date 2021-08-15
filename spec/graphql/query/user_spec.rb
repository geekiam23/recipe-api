require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'query user', type: :graphql do
  let(:query) do
    <<~GQL
      query getUser($token: String!) {
        getUser(token: $token) {
          token
          email
        }
      }
    GQL
  end

  it 'returns the correct token' do
    user = create(:user)
    
    result = execute_graphql(
      query,
      variables: { token: user.token },
    )

    expect(result['data']['getUser']['token']).to eq user.token
  end  

  it 'returns the correct email' do
    user = create(:user)
    
    result = execute_graphql(
      query,
      variables: { token: user.token },
    )

    expect(result['data']['getUser']['email']).to eq user.email
  end  
end
