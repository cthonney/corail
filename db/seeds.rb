ActiveSupport.on_load(:active_job) do
  ActiveJob::Base.queue_adapter = Rails.application.config.active_job.queue_adapter
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'
#Destroy all records (Order is Important)
Booking.destroy_all
Slot.destroy_all
Message.destroy_all
ChatRoom.destroy_all
Property.destroy_all
User.destroy_all

puts "Destroyed all records"
#Create Users
user1 = User.create(email: "seller@corail.me", password: "123456", name: "Thonney", surname: "Cedric", phone_number: "0612345678")
user2 = User.create(email: "buyer@corail.me", password: "123456", name: "Dumas", surname: "Remi", phone_number: "0612345678")
user3 = User.create(email: "seed@corail.me", password: "123456", name: "Seed", surname: "Seed", phone_number: "0612345678")
user4 = User.create(email: "seed2@corail.me", password: "123456", name: "Seed2", surname: "Seed2", phone_number: "0612345678")
admin = User.create(email: "admin@corail.me", password: "admin123456**", name: "Admin", surname: "Admin", phone_number: "0612345678", admin: true)
puts "Created #{User.count} users"
#Attach avatar to users
user1.avatar.attach(io: File.open("app/assets/images/avatars/avatar1.png"), filename: "avatar1.png")
user2.avatar.attach(io: File.open("app/assets/images/avatars/avatar2.png"), filename: "avatar2.png")
user3.avatar.attach(io: File.open("app/assets/images/avatars/avatar3.png"), filename: "avatar3.png")
user4.avatar.attach(io: File.open("app/assets/images/avatars/avatar4.png"), filename: "avatar4.png")
admin.avatar.attach(io: File.open("app/assets/images/avatars/avatar4.png"), filename: "avatar4.png")

puts "Attached avatars to users"

#Create Properties and attach them to users
property1 = Property.create(description: "Magnifique maison sur la montagne", property_type: "House", price: "4000000", living_space: "450", land_surface: "1000", address: "Curepipe", parking_space: 1, pool: false, room: 4, bedrooms: 6, bathroom: 5, sea_view: false, user_id: user3.id)
property2 = Property.create(description: "Magnifique Villa avec vue sur la mer", property_type: "Villa", price: "18000000", living_space: "800", land_surface: "1600", address: "Port Louis", parking_space: 3, pool: true, room: 4, bedrooms: 4, bathroom: 2, sea_view: true, user_id: user3.id)
property3 = Property.create(description: "Magnifique Flat avec vue sur la ville", property_type: "Flat", price: "22000000", living_space: "160", land_surface: "160", address: "Blue bay", parking_space: 3, pool: true, room: 4, bedrooms: 4, bathroom: 2, sea_view: true, user_id: user3.id)
property4 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "House", price: "23000000", living_space: "160", land_surface: "160", address: "Flic en Flac", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property5 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Villa", price: "22000000", living_space: "160", land_surface: "160", address: "Grand-baie", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property6 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Flat", price: "16000000", living_space: "160", land_surface: "160", address: "Flacq", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property7 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "House", price: "10000000", living_space: "160", land_surface: "160", address: "Phoenix, Mauritius", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property8 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Villa", price: "19000000", living_space: "160", land_surface: "160", address: "Phoenix, Mauritius", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property9 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Flat", price: "10000000", living_space: "160", land_surface: "160", address: "Phoenix, Mauritius", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property10 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "House", price: "20000000", living_space: "160", land_surface: "160", address: "Phoenix, Mauritius", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property11 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Villa", price: "10000000", living_space: "160", land_surface: "160", address: "Phoenix, Mauritius", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property12 = Property.create(description: "Magnifique Villa avec vue sur la mer", property_type: "Villa", price: "18000000", living_space: "800", land_surface: "1600", address: "Port Louis", parking_space: 3, pool: true, room: 4, bedrooms: 4, bathroom: 2, sea_view: true, user_id: user3.id)
property13 = Property.create(description: "Magnifique Flat avec vue sur la ville", property_type: "Flat", price: "22000000", living_space: "160", land_surface: "160", address: "Blue bay", parking_space: 3, pool: true, room: 4, bedrooms: 4, bathroom: 2, sea_view: true, user_id: user3.id)
property14 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "House", price: "80000000", living_space: "160", land_surface: "160", address: "Flic en Flac", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)
property15 = Property.create(description: "Magnifique Appartement avec vue sur la ville", property_type: "Villa", price: "10000000", living_space: "160", land_surface: "160", address: "Grand-baie", parking_space: 4, pool: true, room: 4, bedrooms: 2, bathroom: 1, sea_view: false, user_id: user3.id)




puts "Created #{Property.count} properties"

property1.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "house1.png")
property2.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "villa1.png")
property3.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['apartment'])), filename: "flat1.png")
property4.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "house2.png")
property5.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "villa2.png")
property6.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['apartment'])), filename: "flat2.png")
property7.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "house3.png")
property8.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "villa3.png")
property9.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['apartment'])), filename: "flat3.png")
property10.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "house4.png")
property11.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "villa4.png")
property12.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['apartment'])), filename: "flat4.png")
property13.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "house5.png")
property14.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['villa'])), filename: "villa5.png")
property15.photos.attach(io: URI.open(Faker::LoremFlickr.image(size: "640x480", search_terms: ['apartment'])), filename: "flat5.png")










puts "Attached photos to properties"

#TODO Attach pictures to properties

#
#Create Slots and attach them to properties
slot1 = Slot.create(date: "2021-12-01-12:00:00", property_id: property1.id)
slot2 = Slot.create(date: "2021-12-05-13:00:00", property_id: property2.id)
slot3 = Slot.create(date: "2021-12-10-14:00:00", property_id: property3.id)
slot4 = Slot.create(date: "2021-12-15-15:00:00", property_id: property4.id)
slot5 = Slot.create(date: "2021-12-20-16:00:00", property_id: property5.id)
slot6 = Slot.create(date: "2021-12-25-17:00:00", property_id: property6.id)
slot7 = Slot.create(date: "2021-12-30-18:00:00", property_id: property7.id)
slot8 = Slot.create(date: "2022-01-04-19:00:00", property_id: property8.id)
slot9 = Slot.create(date: "2022-01-09-20:00:00", property_id: property9.id)
slot10 = Slot.create(date: "2022-01-14-21:00:00", property_id: property10.id)
slot11 = Slot.create(date: "2022-01-19-22:00:00", property_id: property11.id)
slot12 = Slot.create(date: "2022-01-24-23:00:00", property_id: property12.id)
slot13 = Slot.create(date: "2022-01-29-00:00:00", property_id: property13.id)
slot14 = Slot.create(date: "2022-02-03-01:00:00", property_id: property14.id)
slot15 = Slot.create(date: "2022-02-08-02:00:00", property_id: property15.id)


puts "Created #{Slot.count} slots"

puts "Attached slots to properties"

#Create Bookings
booking1 = Booking

puts "Created #{Slot.count} slots"

#Create Bookings and attach them to slots

booking1 = Booking.create(slot_id: slot1.id, user_id: user4.id)
booking2 = Booking.create(slot_id: slot2.id, user_id: user4.id)
booking3 = Booking.create(slot_id: slot3.id, user_id: user4.id)
booking4 = Booking.create(slot_id: slot4.id, user_id: user4.id)
booking5 = Booking.create(slot_id: slot5.id, user_id: user4.id)
booking6 = Booking.create(slot_id: slot6.id, user_id: user4.id)
booking7 = Booking.create(slot_id: slot7.id, user_id: user4.id)
booking8 = Booking.create(slot_id: slot8.id, user_id: user4.id)
booking9 = Booking.create(slot_id: slot9.id, user_id: user4.id)
booking10 = Booking.create(slot_id: slot10.id, user_id: user4.id)
booking11 = Booking.create(slot_id: slot11.id, user_id: user4.id)
booking12 = Booking.create(slot_id: slot12.id, user_id: user4.id)
booking13 = Booking.create(slot_id: slot13.id, user_id: user4.id)
booking14 = Booking.create(slot_id: slot14.id, user_id: user4.id)
booking15 = Booking.create(slot_id: slot15.id, user_id: user4.id)


puts "Created #{Booking.count} bookings"

puts "***SEED DONE***"






