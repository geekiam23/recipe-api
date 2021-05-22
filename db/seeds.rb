# frozen_string_literal: true

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
  'drink'
]

ocassions = %w[
  fall
  winter
  spring
  summer
]

User.create!(
  email: 'test@gmail.com',
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

cuisines.each do |c|
  Cuisine.create!(
    name: c
  )
end

dish_types.each do |d|
  DishType.create!(
    name: d
  )
end

diets.each do |d|
  Diet.create!(
    name: d
  )
end

ocassions.each do |o|
  Occasion.create!(
    name: o
  )
end

# Create Recipes
50.times do
  Recipe.create!(
    title: Faker::Food.dish,
    summary: Faker::Food.description,
    instructions: Faker::Hacker.say_something_smart,
    servings: Faker::Number.unique.between(from: 1, to: 51),
    user_id: users.ids.sample
  )
end

recipe_ids = Recipe.all.map { |r| r['id']}

10.times do 
  Favorite.create!(
    user_id: 1,
    favoritable_type: Recipe,
    favoritable_id: recipe_ids.sample
  )
end

50.times do
  CuisineRecipe.create!(
    cuisine_id: Cuisine.ids.sample,
    recipe_id: Recipe.ids.sample
  )
end

50.times do
  DishTypeRecipe.create!(
    dish_type_id: DishType.ids.sample,
    recipe_id: Recipe.ids.sample
  )
end

50.times do
  DietRecipe.create!(
    diet_id: Diet.ids.sample,
    recipe_id: Recipe.ids.sample
  )
end

50.times do
  OccasionRecipe.create!(
    occasion_id: Occasion.ids.sample,
    recipe_id: Recipe.ids.sample
  )
end

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Cuisine.count} cuisines created"
puts "#{DishType.count} dish types created"
puts "#{Diet.count} diets created"
puts "#{Occasion.count} occasions created"
puts "#{Favorite.count} favorites created"
puts "#{Recipe.count} recipes created"
