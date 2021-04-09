class Recipe < Spoonacular
  def base
    super + "/recipes/"
  end

  def recipe(id)
    endpoint = id.to_s + '/information'
    params = { :includeNutrition => false }
    get(endpoint, params)
  end

  def recipe_extract(url)
    endpoint = '/extract'
    params = { :url => url.to_s }
    get(endpoint, params)
  end

  def recipe_random
    endpoint = "random"
    params = {}
    get(endpoint, params)["recipes"].first
  end
  
  def recipe_similar(id)
    endpoint = id.to_s + '/similar'
    params = { :number => 2 }
    recipes = get(endpoint, params)
    recipeIds = recipes.map{|recipe| recipe['id']}
    recipes(recipeIds.join(','))
  end
  
  def recipes(ids)
    endpoint = '/informationBulk'
    params = { :ids => ids.to_s }
    get(endpoint, params)
  end
end