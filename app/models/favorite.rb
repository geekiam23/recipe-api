class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true, optional: true
  belongs_to :user
  before_save :save_to_db

  def save_to_db
    unless Recipe.find_by(id: favoritable_id)
      spoon_recipe = Spoonacular::Recipe.new.info(favoritable_id).to_dot

      recipe = Recipe.create do |r|
        r.id = spoon_recipe.id
        r.title = spoon_recipe.title
        r.summary = spoon_recipe.summary
        r.servings = spoon_recipe.servings
        r.instructions = spoon_recipe.instructions
        r.user_id = user_id
      end
    end
  end
end
