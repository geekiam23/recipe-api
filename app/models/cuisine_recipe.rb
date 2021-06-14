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
class CuisineRecipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe
end
