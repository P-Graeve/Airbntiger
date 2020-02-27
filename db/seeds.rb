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
stinky = Pet.new(name: 'Stinky', price_in_eur: 15, pet_type: 'Tiger', description: 'Stinky is a great tiger')
tiger_img = URI.open('https://i.pinimg.com/originals/a2/8c/c9/a28cc94b51b04802f7d033e7c206cbb7.jpg')
stinky.photos.attach(io: tiger_img, filename: 'tiger.jpg', content_type: 'image/jpg')

iguana = Pet.new(name: 'Iguani', price_in_eur: 15, pet_type: 'Iguana', description: 'My favorite iguana')
iguana_img = URI.open('https://www.thoughtco.com/thmb/V_hCTwhYWNsCogFPnNHsedAEsTA=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/iguana2-b554e81fc1834989a715b69d1eb18695.jpg')
iguana.photos.attach(io: iguana_img, filename: 'iguana.jpg', content_type: 'image/jpg')

blubby = Pet.new(name: 'Blubby', price_in_eur: 34.3, pet_type: 'Fish', description: 'Blubby is a great fish')
fish_img = URI.open('https://news.cnrs.fr/sites/default/files/styles/visuel_principal/public/assets/images/nemo2sig_72dpi.jpg')
blubby.photos.attach(io: fish_img, filename: 'fish.jpg', content_type: 'image/jpg')

mauwie = Pet.new(name: 'Mauwie', price_in_eur: 3.55, pet_type: 'Cat', description: 'My cat mauwie is so awesome')
cat_img = URI.open('https://images.unsplash.com/photo-1488740304459-45c4277e7daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80')
mauwie.photos.attach(io: cat_img, filename: 'cat.jpg', content_type: 'image/jpg')

perry = Pet.new(name: 'Perry', price_in_eur: 300, pet_type: 'Parrot', description: 'My parrot perry is so awesome')
parrot_img = URI.open('https://images.unsplash.com/photo-1544181093-c712fb401bdc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
perry.photos.attach(io: parrot_img, filename: 'parrot.jpg', content_type: 'image/jpg')

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
  blubby.user = boris
  mauwie.user = boris
  perry.user = boris
  iguana.user = boris

  stinky.save
  blubby.save
  mauwie.save
  perry.save
  iguana.save

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
