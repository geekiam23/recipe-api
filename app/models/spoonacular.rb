class Spoonacular
  attr_accessor :api_key, :foo

  # To test, you would run this in a rails console:
  # Spoonacular.new.random_recipe

  def initialize(api_key = 'adc2bed5d8c04c25a858a718b7d2df5a')
    @api_key = api_key
  end

  def random_recipe
    endpoint = "random"
    params = {}
    get(endpoint, params)["recipes"].first
  end

  def recipe(id)
    endpoint = id.to_s + '/information'
    params = { :includeNutrition => false }
    get(endpoint, params)
  end
  
  def recipes(ids)
    endpoint = '/informationBulk'
    params = { :ids => ids.to_s }
    get(endpoint, params)
  end

  def similar_recipe(id)
    endpoint = id.to_s + '/similar'
    params = { :number => 2 }
    recipes = get(endpoint, params)
    recipeIds = recipes.map{|recipe| recipe['id']}
    recipes(recipeIds.join(','))
  end

  def extract_recipe(url)
    endpoint = '/extract'
    params = { :url => url.to_s }
    p recipe = get(endpoint, params)
  end

  def base
    "https://api.spoonacular.com/recipes/"
  end

  def auth
    {apiKey: @api_key}
  end

  def get(endpoint, params = {})
    url = base + endpoint
    params = params.merge!(auth)
    resp = Excon.get(url, query: params)
    JSON.parse(resp.body)
  end

end
