class MealPlan < ApplicationRecord
	belongs_to :meal_day
	belongs_to :meal_type
	belongs_to :recipes
end
