# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "cleaning database"
Product.destroy_all
User.destroy_all

puts "generating users"

avatar1 = URI.open('https://avatars3.githubusercontent.com/u/58790438?v=4')
avatar2 = URI.open('https://avatars0.githubusercontent.com/u/28073539?v=4')
avatar3 = URI.open('https://avatars1.githubusercontent.com/u/59839816?v=4')

user1 = User.create({
  first_name: 'Jerome',
  last_name: 'Crest',
  email: 'jerome.crest@gmail.com',
  password: 'password'
})
user1.avatar.attach(io: avatar1, filename: 'jerome.jpeg', content_type: 'image/jpeg')

user2 = User.create({
  first_name: 'Gaetan',
  last_name: 'Mallet',
  email: 'malletgaetantmp@gmail.com',
  password: 'password'
})
user2.avatar.attach(io: avatar2, filename: 'gaetan.jpeg', content_type: 'image/jpeg')

user3 = User.create({
  first_name: 'Tib',
  last_name: 'Adet',
  email: 'thibault.adet@gmail.com',
  password: 'password'
})
user3.avatar.attach(io: avatar3, filename: 'tib.jpeg', content_type: 'image/jpeg')

puts "users generated!"


puts "generating products"

product1_photo = URI.open('https://www.placedelaloc.com/sites/default/files/styles/annonce_detail/public/annonces/2016/01/28/16244/location-ski_rossignol-1049574906.jpg?itok=8f7wdso6')
product2_photo  = URI.open('https://www.placedelaloc.com/sites/default/files/styles/annonce_detail/public/annonces/2017/11/06/33683/location-skis_salomon_xwing_cruiser_158m-1816326028.jpg?itok=6mwG8PjU')
product3_photo = URI.open('https://app.sportyrent.com/uploads/quentin%20snow%200.jpg')

product1 = Product.create({
  name: 'Skis Rossignol 170',
  address: 'Serre Chevalier',
  description: 'Skis Rossignol 170 de 2020 état neuf',
  price: 10,
  category: 'skis',
  user: user1
})
product1.photos[0].attach(io: product1_photo, filename: 'ski_rossignol.jpeg', content_type: 'image/jpeg')

product2 = Product.create({
  name: 'Skis Salomon 160',
  address: 'Serre Chevalier',
  description: 'Skis Salomon 160 de 2019 en très bon état',
  price: 15,
  category: 'skis',
  user: user1
})
product2.photos[0].attach(io: product2_photo, filename: 'ski_salomon.jpeg', content_type: 'image/jpeg')


product3 = Product.create({
  name: 'Snowboard Salomon 150',
  address: 'Orcière Merlette',
  description: 'Snowboard freeride',
  price: 10,
  category: 'snowboard',
  user: user2
})
product3.photos[0].attach(io: product3_photo, filename: 'snow_rossignol.jpeg', content_type: 'image/jpeg')

puts "product generated!"



