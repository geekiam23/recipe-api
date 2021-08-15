module Types
  class MutationType < Types::BaseObject
    field :create_account_mutation, mutation: Mutations::Auth::CreateAccountMutation
    field :create_recipe_favorite_mutation, mutation: Mutations::Recipe::CreateFavoriteMutation
    field :delete_recipe_favorite_mutation, mutation: Mutations::Recipe::DeleteFavoriteMutation
    field :create_meal_day_mutation, mutation: Mutations::Recipe::CreateMealDayMutation
    field :create_meal_plan_mutation, mutation: Mutations::Recipe::CreateMealPlanMutation
    field :update_meal_plan_mutation, mutation: Mutations::Recipe::UpdateMealPlanMutation
    field :sign_in_mutation, mutation: Mutations::Auth::SignInMutation
    field :sign_out_mutation, mutation: Mutations::Auth::SignOutMutation
  end
end
