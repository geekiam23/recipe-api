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
class DietRecipe < ApplicationRecord
  belongs_to :diet
  belongs_to :recipe
end
