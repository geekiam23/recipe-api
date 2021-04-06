class RecipesController < ApplicationController

  def random
    @recipe = Spoonacular.new.random_recipe
    @image_base = "https://spoonacular.com/cdn/ingredients_100x100/"
  end

end
