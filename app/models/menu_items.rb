class MenuItems < Spoonacular
  def base
    super + "food/menuItems/"
  end

  def menu_item_info(id)
    endpoint = id.to_s
    params = {}
    get(endpoint, params)
  end

  def menu_items(query, number = 10)
    endpoint = "/search"
    params = {:query => query, :number => number}
    get(endpoint, params)
  end
end