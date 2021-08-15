class CreateMealPlanRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plan_recipes do |t|
      t.integer :meal_plan_id
      t.integer :recipe_id
      
      t.timestamps
    end
  end
end
