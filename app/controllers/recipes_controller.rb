class RecipesController < ApplicationController

  def index
  end

  def show
  end

  def random
    @recipe = Spoonacular.new.random_recipe
  end

end
