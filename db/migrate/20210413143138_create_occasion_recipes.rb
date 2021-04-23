class CreateOccasionRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :occasion_recipes do |t|
      t.belongs_to :occasion, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
