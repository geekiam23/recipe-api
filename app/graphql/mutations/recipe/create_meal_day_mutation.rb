# frozen_string_literal: true

module Mutations
  module Recipe
    class CreateMealDayMutation  < Mutations::BaseMutation
      description 'User creates a meal day'
      argument :user_id, ID, required: true
      argument :day, String, required: true

      field :meal_day, Types::MealDayType, null: true

      def resolve(input)
				meal_day = MealDay.new(day: input[:day], user_id: input[:user_id])

        if meal_day.save
          {
            meal_day: meal_day,
            success: true,
            errors: []
          }
        else
          {
            meal_day: nil,
            success: false,
            errors: [{
              message: meal_day.errors
            }]
          }
        end
      end
    end 
  end 
end 