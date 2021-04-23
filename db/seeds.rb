# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  Recipe.create!(
    title: Faker::Movies::HarryPotter.quote,
    summary: Faker::Hacker.say_something_smart,
    instructions: Faker::Hacker.say_something_smart,
    servings: Faker::Number.unique.between(1, 11)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Recipe.count} recipes created"