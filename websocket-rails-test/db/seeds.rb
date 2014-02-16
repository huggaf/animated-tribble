# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create([
  {name: 'Why\'s (poignant) guide to Ruby', price: 9.9},
  {name: 'The Ruby Way', price: 14.95},
  {name: 'The Rails Way', price: 22.90},
  {name: 'Rework', price: 9.99},
  {name: 'Getting Real', price: 16.65},
  {name: 'Remote', price: 13.13},
  {name: 'Agile Web Development with Rails 4', price: 26.37},
  {name: 'The Well-Grounded Rubyist', price: 31.21},
  {name: 'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends', price: 25.20}
])