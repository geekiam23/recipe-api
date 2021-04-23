class DishType < ApplicationRecord
  has_many :dish_type_recipes
  has_many :recipes, through: :dish_type_recipes
end
