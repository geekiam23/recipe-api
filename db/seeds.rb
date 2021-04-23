require 'faker'

# Create Users
10.times do
  email = Faker::Internet.unique.email
  password = Faker::Lorem.characters(number: 8)

  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    created_at: Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
end

10.times do
  Cuisine.create!(
    name: Faker::Food.dish
  )
end

10.times do
  DishType.create!(
    name: Faker::Food.dish
  )
end

10.times do
  Diet.create!(
    name: Faker::Food.dish
  )
end

10.times do
  Occasion.create!(
    name: Faker::Food.dish
  )
end

# Create Recipes
50.times do
  Recipe.create!(
    title: Faker::Movies::HarryPotter.quote,
    summary: Faker::Hacker.say_something_smart,
    instructions: Faker::Hacker.say_something_smart,
    servings: Faker::Number.unique.between(from: 1, to: 51),
    user_id: User.ids.sample
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