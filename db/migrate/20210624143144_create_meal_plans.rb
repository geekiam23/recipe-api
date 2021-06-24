class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.belongs_to :meal_day, null: false, foreign_key: true
      t.references :meal_type, null: true, foreign_key: true
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
