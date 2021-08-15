# frozen_string_literal: true

module Mutations
  module Recipe
    class CreateMealPlanMutation  < Mutations::BaseMutation
      description 'User creates a meal day'
      argument :meal_day_id, ID, required: true
      argument :meal_type_id, ID, required: true
      argument :recipe_ids, [ID], required: true

      field :meal_plan, Types::MealPlanType, null: true

      def resolve(input)
        meal_plan = MealPlan.new({
          meal_day_id: input[:meal_day_id],
          meal_type_id: input[:meal_type_id],
          recipe_ids: input[:recipe_ids]
        })

        if meal_plan.save
          {
            meal_plan: meal_plan,
            success: true,
            errors: []
          }
        else
          {
            meal_plan: nil,
            success: false,
            errors: [{
              message: meal_plan.errors
            }]
          }
        end
      end
    end 
  end 
end 