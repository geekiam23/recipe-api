class Recipe < ApplicationRecord
  belongs_to :user
  has_many :cuisine_recipes
  has_many :cuisines, through: :cuisine_recipes
end
