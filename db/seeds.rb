# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genre = %w[masculino feminino]

50.times do |index|
  client = Client.new(
    id: index,
    name: Faker::Name.name,
    genre: genre.sample,
    email: Faker::Internet.email,
    cellphone_number: Faker::Number.number(digits: 4)
  )
  cart = Cart.new(
    id: index,
    total_price: 0,
    client_id: client.id
  )
  client.save!
  cart.save!
end
