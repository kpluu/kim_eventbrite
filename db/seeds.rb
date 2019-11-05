require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all

12.times do
  u = User.create(email: ["frankyboss@yopmail.com", "catherinethpcode@yopmail.com", "gerardthpcode@yopmail.com", "jeanclaudethpcode@yopmail.com", "morganethpcode@yopmail.com", "michelthpcode@yopmail.com"].sample, encrypted_password: Faker::Verb.simple_present, description: Faker::Movie.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  e = Event.create(start_date: Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 9, format: :default), duration: rand(1..140), title: Faker::JapaneseMedia::OnePiece.akuma_no_mi, description: Faker::JapaneseMedia::OnePiece.quote, price: rand(20..50), location: Faker::Nation.capital_city, admin_id: u.id)
end