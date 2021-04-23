require 'faker'

cuisines = [
  'african',
  'american',
  'british',
  'cajun',
  'caribbean',
  'chinese',
  'eastern european',
  'european',
  'french',
  'german',
  'greek',
  'indian',
  'irish',
  'italian',
  'japanese',
  'jewish',
  'korean',
  'latin american',
  'mediterranean',
  'mexican',
  'middle eastern',
  'nordic',
  'southern',
  'spanish',
  'thai',
  'vietnamese'
]

diets = [
  'gluten free',
  'ketogenic',
  'vegetarian',
  'lacto-vegertarian',
  'ovo-vegetarian',
  'vegan',
  'pescetarian',
  'paleo',
  'primal',
  'whole30'
]

dish_types = [
  'main course',
  'side dish',
  'dessert',
  'appetizer',
  'salad',
  'bread',
  'breakfast',
  'soup',
  'beverage',
  'sauce',
  'marinade',
  'fingerfood',
  'snack',
  'drink',
]

ocassions = [
  'fall',
  'winter',
  'spring',
  'summer'
]

User.create!(
  email: 't@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  created_at: Faker::Date.between(from: 2.years.ago, to: Date.today)
)

# Create Users
10.times do
  email = Faker::Internet.unique.email
  password = 'password'
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    created_at: Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
end

users = User.all

cuisines.each { |c|
  Cuisine.create!(
    name: c
  )
}

dish_types.each { |d| 
  DishType.create!(
    name: d
  )
}

diets.each { |d|
  Diet.create!(
    name: d
  )
}

ocassions.each { |o|
  Occasion.create!(
    name: o
  )
}

# Create Recipes
50.times do
  Recipe.create!(
    title: Faker::Movies::HarryPotter.quote,
    summary: Faker::Hacker.say_something_smart,
    instructions: Faker::Hacker.say_something_smart,
    servings: Faker::Number.unique.between(from: 1, to: 51),
    user_id: users.ids.sample
  )
end

25.times do
  Favorite.create!(
    user_id: users.ids.sample,
    recipe_id: Recipe.ids.sample,
  )
end

50.times do
  CuisineRecipe.create!(
    cuisine_id: Cuisine.ids.sample,
    recipe_id: Recipe.ids.sample,
  )
end

50.times do
  DishTypeRecipe.create!(
    dish_type_id: DishType.ids.sample,
    recipe_id: Recipe.ids.sample,
  )
end

50.times do
  DietRecipe.create!(
    diet_id: Diet.ids.sample,
    recipe_id: Recipe.ids.sample,
  )
end

50.times do
  OccasionRecipe.create!(
    occasion_id: Occasion.ids.sample,
    recipe_id: Recipe.ids.sample,
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Cuisine.count} cuisines created"
puts "#{DishType.count} dish types created"
puts "#{Diet.count} diets created"
puts "#{Occasion.count} occasions created"
puts "#{Recipe.count} recipes created"