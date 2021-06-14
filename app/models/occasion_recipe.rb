# frozen_string_literal: true

# == Schema Information
#
# Table name: occasion_recipes
#
#  id          :bigint           not null, primary key
#  occasion_id :bigint           not null
#  recipe_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class OccasionRecipe < ApplicationRecord
  belongs_to :occasion
  belongs_to :recipe
end
