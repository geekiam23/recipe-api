class MealPlan < ApplicationRecord
	belongs_to :meal_day
	has_many :meal_types
	has_many :recipes
end
