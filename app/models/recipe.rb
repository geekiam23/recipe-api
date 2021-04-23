class Recipe < ApplicationRecord
  belongs_to :user
  has_many :cuisine_recipes
  has_many :cuisines, through: :cuisine_recipes
  has_many :dish_type_recipes
  has_many :dish_types, through: :dish_type_recipes
  has_many :diet_recipes
  has_many :diets, through: :diet_recipes
  has_many :occasion_recipes
  has_many :occasions, through: :occasion_recipes
end
