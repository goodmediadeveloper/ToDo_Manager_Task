# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

4.times do
  User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  }])
end

2.times do
  Admin.create([
    {
    name: "God",
    email: "paradise@mail.paradise",
    password: "12apostols"
    },
    {
    name: "Devil",
    email: "hell@mail.hell",
    password: "baby1998"
    }
  ])
end
