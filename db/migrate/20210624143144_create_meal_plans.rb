class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.integer :meal_day_id
      t.integer :meal_type_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
