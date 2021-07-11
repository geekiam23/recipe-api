class MealDay < ApplicationRecord
	belongs_to :user
	has_many :meal_plans
	has_many :recipes, through: :meal_plans
	has_many :meal_types, through: :meal_plans
end
