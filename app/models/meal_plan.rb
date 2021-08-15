# == Schema Information
#
# Table name: meal_plans
#
#  id           :bigint           not null, primary key
#  meal_day_id  :integer
#  meal_type_id :integer
#  recipe_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class MealPlan < ApplicationRecord
	belongs_to :meal_day
	belongs_to :meal_type
	
	has_many :meal_plan_recipes, dependent: :destroy
	has_many :recipes, through: :meal_plan_recipes
end
