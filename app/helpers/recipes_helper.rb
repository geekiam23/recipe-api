module RecipesHelper
  def capitalize_join_text(data)
    data.map{ |c| c.name.capitalize }.join(', ')
  end
end
