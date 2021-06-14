# frozen_string_literal: true

# == Schema Information
#
# Table name: diet_recipes
#
#  id         :bigint           not null, primary key
#  diet_id    :bigint           not null
#  recipe_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class DietRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
