# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  title        :string
#  servings     :integer
#  summary      :text
#  instructions :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
