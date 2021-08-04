class CreateMealDays < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_days do |t|
      t.date :day
      t.integer :user_id

      t.timestamps
    end
  end
end
