class CreateMealTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_types do |t|
      t.string :name
      t.belongs_to :meal_day, null: false, foreign_key: true
      t.belongs_to :meal_plan, null: false, foreign_key: true
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
