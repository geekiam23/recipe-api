class MealDay < ApplicationRecord
	has_many :meal_plans
	has_many :recipes
	has_many :meal_types
end
