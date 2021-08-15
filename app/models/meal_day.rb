# == Schema Information
#
# Table name: meal_days
#
#  id         :bigint           not null, primary key
#  day        :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MealDay < ApplicationRecord
	belongs_to :user
	has_many :meal_plans
	has_many :recipes, through: :meal_plans
	has_many :meal_types, through: :meal_plans
end
