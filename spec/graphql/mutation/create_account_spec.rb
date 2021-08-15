require 'rails_helper'
require_relative '../../support/graphql_helpers.rb'

RSpec.describe 'Mutations createAccountMutation', type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation createAccount($email: String!, $password: String!, $passwordConfirmation: String!) {
        createAccountMutation(email: $email, password: $password, passwordConfirmation: $passwordConfirmation) {
          token
          success
          errors {
            message
          }
          user {
            id
            token
          }
        }
      }
    GQL
  end

  context 'when variables are valid' do
    it 'saves the user' do
      result = execute_graphql(
        mutation,
        variables: { email: 'newAccount@test.com', password: 'password', passwordConfirmation: 'password' },
      )

      expect(result['data']['createAccountMutation']['success']).to eq true
      expect(result['data']['createAccountMutation']['token']).to be
      expect(result['data']['createAccountMutation']['user']['id']).to be
    end
  end

  context 'when variables are invalid' do
    it 'returns an email error message' do
      result = execute_graphql(
        mutation,
        variables: { email: 'whatever', password: 'what', passwordConfirmation: 'pass' },
      )

      expect(result['data']['createAccountMutation']['success']).to eq false
      expect(result['data']['createAccountMutation']['errors'][0]['message']).to eq 'Email format is invalid'
    end

    it 'returns an password error message' do
      result = execute_graphql(
        mutation,
        variables: { email: 'whatever@test.com', password: 'what', passwordConfirmation: 'what' },
      )

      expect(result['data']['createAccountMutation']['success']).to eq false
      expect(result['data']['createAccountMutation']['errors'][0]['message']).to eq 'Email format is invalid'
    end

    it 'returns an password error message' do
      result = execute_graphql(
        mutation,
        variables: { email: 'whatever@test.com', password: 'whatever', passwordConfirmation: 'password' },
      )

      expect(result['data']['createAccountMutation']['success']).to eq false
      expect(result['data']['createAccountMutation']['errors'][0]['message']).to eq 'Email format is invalid'
    end
  end
end
