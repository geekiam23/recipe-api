class Occasion < ApplicationRecord
  has_many :occasion_recipes
  has_many :recipes, through: :occasion_recipes
end
