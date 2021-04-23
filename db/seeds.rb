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

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Cuisine.count} cuisines created"
puts "#{Recipe.count} recipes created"