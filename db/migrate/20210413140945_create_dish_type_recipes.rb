# frozen_string_literal: true

class CreateDishTypeRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_type_recipes do |t|
      t.belongs_to :dish_type, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
