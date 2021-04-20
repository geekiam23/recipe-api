class Cuisine < ApplicationRecord
  has_many :cuisine_recipes
  has_many :recipes, through: :cuisine_recipes

  def name_for_select
    name.capitalize
  end
end
