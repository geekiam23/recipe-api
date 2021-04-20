class Occasion < ApplicationRecord
  has_many :occasion_recipes
  has_many :recipes, through: :occasion_recipes

  def name_for_select
    name&.capitalize
  end
end
