class MealType < ApplicationRecord
	belongs_to :meal_plan
	belongs_to :meal_day
	has_many :recipes
end
