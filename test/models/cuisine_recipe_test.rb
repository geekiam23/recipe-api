# frozen_string_literal: true

# == Schema Information
#
# Table name: cuisine_recipes
#
#  id         :bigint           not null, primary key
#  cuisine_id :bigint           not null
#  recipe_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CuisineRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
