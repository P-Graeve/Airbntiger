# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
# remove all pets
puts "Cleaning DB..."
Booking.destroy_all
Pet.destroy_all
User.destroy_all
# create 4 pets
stinky = Pet.new(name: 'Stinky', price_in_eur: 15, pet_type: 'tiger', description: 'Stinky is a great tiger')
# attach an image to Stinky
tiger_img = URI.open('https://i.pinimg.com/originals/a2/8c/c9/a28cc94b51b04802f7d033e7c206cbb7.jpg')
stinky.photos.attach(io: tiger_img, filename: 'tiger.jpg', content_type: 'image/jpg')

bella = Pet.new(name: 'Bella', price_in_eur: 34.3, pet_type: 'dog', breed: 'labrador', description: 'Bella is a great labrador')
mauwie = Pet.new(name: 'Mauwie', price_in_eur: 3.55, pet_type: 'tiger', description: 'My cat mauwie is so awesome')
perry = Pet.new(name: 'Perry', price_in_eur: 300, pet_type: 'parrot', description: 'My parrot perry is so awesome')

boris = User.create(username: 'Boris', password: 'Password', password_confirmation: 'Password', email: 'boris@example.com')
svenia = User.create(username: 'Svenia', password: 'Password', password_confirmation: 'Password', email: 'svenia@example.com')

avatar_boris = URI.open('https://avatars1.githubusercontent.com/u/2471555?s=460&v=4')
avatar_svenia = URI.open('https://heroes.ch/wp-content/uploads/2019/10/svenia-wurm-1-600x400.jpg')

boris.avatar.attach(io: avatar_boris, filename: 'avatar.jpg', content_type: 'image/jpg')
svenia.avatar.attach(io: avatar_svenia, filename: 'avatar.jpg', content_type: 'image/jpg')

boris.save
svenia.save
if User.count < 2
  puts "Cannot save Boris: #{boris.errors.full_messages}"
  puts "Cannot save Svenia: #{svenia.errors.full_messages}"
else
  puts "Pets will be assigned to Boris: #{boris.email}"
  stinky.user = boris
  bella.user = boris
  mauwie.user = boris
  perry.user = boris
  stinky.save
  bella.save
  mauwie.save
  perry.save
  booking = Booking.new(start_date: Date.parse('29/2/2020'), end_date: Date.parse('3/3/2020'))
  booking.user = svenia
  booking.pet = stinky
  booking.save

  puts "You have #{Pet.count} pets now and #{Booking.count} bookings"
  puts ""
  puts "Your user is also destroyed, please sign in using: email: boris@example.com, password: Password, I'm sorry guys"
  puts ""
  puts "I made a demo account (Svenia): (email: svenia@example.com, password: Password) so that we can make a booking with her account (already has 1 saved booking on her account)"
end