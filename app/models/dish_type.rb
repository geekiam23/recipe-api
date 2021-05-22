# frozen_string_literal: true

class DishType < ApplicationRecord
  has_many :dish_type_recipes
  has_many :recipes, through: :dish_type_recipes
  has_many :favorites, as: :favoritable, dependent: :destroy

  def name_for_select
    name.capitalize
  end
end
