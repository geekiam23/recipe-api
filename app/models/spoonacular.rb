class Spoonacular
  attr_accessor :api_key

  # To test, you would run this in a rails console:
  # Spoonacular.new.random_recipe

  def initialize(api_key = 'adc2bed5d8c04c25a858a718b7d2df5a')
    @api_key = api_key
  end

  def base
    "https://api.spoonacular.com/"
  end

  def auth
    {apiKey: api_key}
  end

  def get(endpoint, params = {})
    url = base + endpoint
    params = params.merge!(auth)
    resp = Excon.get(url, query: params)
    JSON.parse(resp.body)
  end

  def search(query)
    endpoint = 'food/site/search'
    params = { :query => query }
    get(endpoint, params)
  end
end
