# frozen_string_literal: true

class DishType < ApplicationRecord
  has_many :dish_type_recipes
  has_many :recipes, through: :dish_type_recipes

  def name_for_select
    name.capitalize
  end
end
