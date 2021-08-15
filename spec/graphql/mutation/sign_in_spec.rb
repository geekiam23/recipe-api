require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe Mutations::Auth::SignInMutation, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation SignMeIn($email: String!, $password: String!) {
        signInMutation(email: $email, password: $password) {
          token
          success
          errors {
            message
          }
        }
      }
    GQL
  end

  context 'when variables are valid' do
    it 'returns user token' do
      user = create(:user)

      result = execute_graphql(
        mutation,
        variables: { email: user.email, password: 'password' },
      )

      expect(result['data']['signInMutation']['success']).to eq true
      expect(result['data']['signInMutation']['token']).to be
    end
  end

  context 'when variables are invalid' do
    it 'an error message' do
      user = create(:user)

      result = execute_graphql(
        mutation,
        variables: { email: user.email, password: 'pass' },
      )

      expect(result['data']['signInMutation']['success']).to eq false
      expect(result['data']['signInMutation']['errors'][0]['message']).to eq 'Incorrect email or password'
    end
  end
end
