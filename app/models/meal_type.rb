class MealType < ApplicationRecord
	has_many :meal_plans
	has_many :meal_days, through: :meal_plans
	has_many :recipes, through: :meal_plans
end
