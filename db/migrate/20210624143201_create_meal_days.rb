class CreateMealDays < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_days do |t|
      t.date :day
      t.references :meal_plan, null: true, foreign_key: true
      t.references :meal_type, null: true, foreign_key: true

      t.timestamps
    end
  end
end
