# == Schema Information
#
# Table name: meal_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MealType < ApplicationRecord
	has_many :meal_plans
	has_many :meal_days, through: :meal_plans
	has_many :recipes, through: :meal_plans
end
