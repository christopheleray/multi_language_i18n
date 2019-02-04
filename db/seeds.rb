# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Post.delete_all
User.delete_all
5.times do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    locale: "fr"
  )
  p "User fr #{i} : créé"
end

5.times do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    locale: "en"
  )
  p "User en #{i} : créé"
end

50.times do |i|
  Post.create!(
    title: Faker::FamilyGuy.character,
    content: Faker::FamilyGuy.quote,
    user_id: Faker::Number.between(User.first.id, User.last.id)
  )
  p "Post #{i} : créé"
end
