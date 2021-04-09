class Product < Spoonacular
  def base
    super + "food/products/"
  end

  def product(id)
    endpoint = id.to_s
    params = {}
    get(endpoint, params)
  end

  def product_search(query, number = 1)
    endpoint = "/search"
    params = {:query => query, :number => number}
    get(endpoint, params)
  end

  def product_search_upc(upc)
    endpoint = "/upc/" + upc.to_s
    params = {}
    get(endpoint, params)
  end

  def product_similiar_items_upc(upc)
    endpoint = "/upc/" + upc.to_s
    params = {}
    get(endpoint, params)
  end
end