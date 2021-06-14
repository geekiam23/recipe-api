# frozen_string_literal: true

# == Schema Information
#
# Table name: dish_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DishType < ApplicationRecord
  has_many :dish_type_recipes
  has_many :recipes, through: :dish_type_recipes

  def name_for_select
    name.capitalize
  end
end
