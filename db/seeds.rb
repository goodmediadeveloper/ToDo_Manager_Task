# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



2.times do
  User.create([
    {
    name: "God",
    # email: "paradise@mail.paradise",
    email: "goodmediadeveloper@gmail.com",
    password: "12apostols",
    admin: true
    },
    {
    name: "Devil",
    # email: "hell@mail.hell",
    email: "dimitriyprokharau@gmail.com",
    password: "baby1998",
    admin: true
    }
  ])
end

4.times do
  User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    admin: false
  }])
end
