require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe Mutations::Auth::SignOutMutation, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation SignOut($token: String!) {
        signOutMutation(token: $token) {
          success
          errors {
            message
          }
        }
      }
    GQL
  end

  context 'when user is signed in' do
    it 'successful logs user out' do
      user = create(:user)

      result = execute_graphql(
        mutation,
        variables: { token: user.token },
      )

      expect(result['data']['signOutMutation']['success']).to eq true
    end
  end

  context 'when user is already signed out' do
    it 'returns a error message' do
      user = create(:user)

      result = execute_graphql(
        mutation,
        variables: { token: 'whatever'},
      )

      expect(result['data']['signOutMutation']['success']).to eq false
      expect(result['data']['signOutMutation']['errors'][0]['message']).to eq 'User already signed out'
    end
  end
end
