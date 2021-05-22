# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :require_login

  def index
    @recipes = Recipe.includes(:cuisines, :diets, :dish_types, :occasions).where(user_id: current_user.id)
    # TODO: Refactor to include favs instead of just created
    # @recipes = current_user.favorites.where(favoritable_type: "Recipe").includes(:cuisines, :diets, :dish_types, :occasions)
  end

  def search
    @recipes = Recipe.includes(:cuisines, :diets, :dish_types, :occasions).search(params[:search])
  end

  # add spoon to search feature

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was saved successfully.'
    else
      flash.now[:alert] = 'Error creating recipe. Please try again.'
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @image_ingredient_base = "https://spoonacular.com/cdn/ingredients_100x100/"
    @image_equipment_base = "https://spoonacular.com/cdn/equipment_100x100/"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)

    if @recipe.save
      flash[:notice] = 'Recipe was updated'
      redirect_to @recipe
    else
      flash.now[:alert] = 'Error saving recipe. Please try again.'
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "\"#{@recipe.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = 'There was an error deleting the recipe.'
      render :show
    end
  end

  def random
    @recipes = Spoonacular::Recipe.new.random(recipe_random_params).map{|s| s.to_dot }
    @image_ingredient_base = 'https://spoonacular.com/cdn/ingredients_100x100/'
    @image_equipment_base = 'https://spoonacular.com/cdn/equipment_100x100/'

    # TODO: refactor.
    render 'recipes/index_spoon', object: @recipes
  end

  def random_show
    @recipe = Spoonacular::Recipe.new.info(params[:id]).to_dot
    @image_ingredient_base = "https://spoonacular.com/cdn/ingredients_100x100/"
    @image_equipment_base = "https://spoonacular.com/cdn/equipment_100x100/"
    render 'show'
  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def recipe_random_params
    params.require(:random).permit(:id, :number, tags: [])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :summary, :servings, :instructions, cuisine_ids: [], diet_ids: [],
                                                                               dish_type_ids: [], occasion_ids: [])
  end
end
