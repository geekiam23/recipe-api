# frozen_string_literal: true

# == Schema Information
#
# Table name: dish_type_recipes
#
#  id           :bigint           not null, primary key
#  dish_type_id :bigint           not null
#  recipe_id    :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class DishTypeRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
