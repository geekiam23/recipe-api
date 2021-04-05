class Recipe < Spoonacular
  def base
    super + "/recipes/"
  end

  def random_recipe
    endpoint = "random"
    params = {}
    get(endpoint, params)["recipes"].first
  end

  def recipes
    endpoint = "all"
    params = {}
    get(endpoint, params)["recipes"].first
  end

  def base
    "https://api.spoonacular.com/recipes/"
  end
end