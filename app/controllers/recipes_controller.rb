class RecipesController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe was saved successfully."
    else
      flash.now[:alert] = "Error creating recipe. Please try again."
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe was updated"
      redirect_to @recipe
    else
      flash.now[:alert] = "Error saving recipe. Please try again."
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "\"#{@recipe.title}\" was deleted successfully."
     redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the recipe."
      render :show
    end
  end

  def random
    @recipe = Spoonacular::Recipe.new.random.to_dot
    @image_ingredient_base = "https://spoonacular.com/cdn/ingredients_100x100/"
    @image_equipment_base = "https://spoonacular.com/cdn/equipment_100x100/"
    # puts JSON.pretty_generate @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :summary, :servings, :instructions, :cuisine )
  end
end
