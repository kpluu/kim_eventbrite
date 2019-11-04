require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

10.times do |index|
  u = User.create(first_name: Faker::Name.name, last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.between(from: 20, to: 50), city_id: c.id)
end