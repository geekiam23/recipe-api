# frozen_string_literal: true

module Mutations
  module Recipe
    class UpdateMealPlanMutation  < Mutations::BaseMutation
      description 'User creates a meal day'
      argument :meal_plan_id, ID, required: true
      argument :recipe_ids, [ID], required: true

      field :meal_plan, Types::MealPlanType, null: true

      def resolve(input)
        meal_plan = MealPlan.find(input[:meal_plan_id])

        meal_plan.recipe_ids = input[:recipe_ids]

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