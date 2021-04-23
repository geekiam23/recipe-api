class Diet < ApplicationRecord
  has_many :diet_recipes
  has_many :recipes, through: :diet_recipes
end
