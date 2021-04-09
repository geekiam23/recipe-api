class RecipesController < ApplicationController

  def random
    @recipe = Recipe.new.recipe_random
    @image_base = "https://spoonacular.com/cdn/ingredients_100x100/"
  end

end
