# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# remove all pets
puts "Cleaning DB..."
Pet.destroy_all

# create 4 pets
Pet.create(name: 'Stinky', price_in_eur: 15, pet_type: 'rhino', description: 'What a great stinky animal and some Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor rerum, tenetur tempore explicabo hic culpa, ab, similique labore officiis ut, placeat! Iusto esse nulla perferendis natus amet nobis quidem repudiandae!')
Pet.create(name: 'Bella', price_in_eur: 34.3, pet_type: 'dog', breed: 'labrador', description: 'My dog bella is so awesome Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque, earum labore fugit sit distinctio molestiae modi dolorum beatae, hic molestias eveniet tempora vel. Officia, doloribus quam illum corporis eveniet ducimus?')
Pet.create(name: 'Mauwie', price_in_eur: 3.55, pet_type: 'cat', description: 'My cat mauwie is so awesome Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque, earum labore fugit sit distinctio molestiae modi dolorum beatae, hic molestias eveniet tempora vel. Officia, doloribus quam illum corporis eveniet ducimus?')
Pet.create(name: 'Perry', price_in_eur: 300, pet_type: 'parrot', description: 'My parrot perry is so awesome Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque, earum labore fugit sit distinctio molestiae modi dolorum beatae, hic molestias eveniet tempora vel. Officia, doloribus quam illum corporis eveniet ducimus?')

puts "You have #{Pet.count} pets now"