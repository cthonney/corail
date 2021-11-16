# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Destroy all records (Order is Important)
Booking.destroy_all
Slot.destroy_all
Message.destroy_all
ChatRoom.destroy_all
Property.destroy_all
User.destroy_all


puts "Destroyed all records"
#Create Users
user1 = User.create(email: 'c@corail.me', password: '123456', name: 'Thonney', surname: "Cedric", phone_number: "0612345678")
user2 = User.create(email: 'r@corail.me', password: '123456', name: 'Dumas', surname: "Remi", phone_number: "0612345678")
user3 = User.create(email: 'n@corail.me', password: '123456', name: 'Anauth', surname: "Nikhil", phone_number: "0612345678")
admin = User.create(email: 'admin@corail.me', password: 'admin123456**', name: 'Admin', surname: "Admin", phone_number: "0612345678", admin: true)
puts "Created #{User.count} users"
#Attach avatar to users
user1.avatar.attach(io: File.open("app/assets/images/avatars/avatar1.png"), filename: "avatar1.png")
user2.avatar.attach(io: File.open("app/assets/images/avatars/avatar2.png"), filename: "avatar2.png")
user3.avatar.attach(io: File.open("app/assets/images/avatars/avatar3.png"), filename: "avatar3.png")
admin.avatar.attach(io: File.open("app/assets/images/avatars/avatar4.png"), filename: "avatar4.png")

puts "Attached avatars to users"

#Create Properties and attach them to users
property1 = Property.create(property_type: "House", price: "100", living_space: "100", land_surface: "100", address: "Paris", latitude: "48.866667", longitude: "2.333333", parking_space: "1", pool: false, room: 4, bathroom: 5, sea_view: true, user_id: user1.id)
property2 = Property.create(property_type: "Villa", price: "200", living_space: "100", land_surface: "100", address: "Blue-bay", latitude: "20.437257", longitude: "57.713574", parking_space: "3", pool: true, room: 3, bathroom: 2, sea_view: true, user_id: user2.id)
property3 = Property.create(property_type: "Apartment", price: "300", living_space: "100", land_surface: "100", address: "Port Louis", latitude: "-20.166059", longitude: "57.482053", parking_space: "1", pool: false, room: 4, bathroom: 5, sea_view: true, user_id: user3.id)

puts "Created #{Property.count} properties"

#TODO Attach pictures to properties

#
#Create Slots and attach them to properties
slot1 = Slot.create(date: "2021-12-01-12:00:00", property_id: property1.id)
slot2 = Slot.create(date: "2021-12-05-13:00:00", property_id: property2.id)
slot3 = Slot.create(date: "2021-12-10-14:00:00", property_id: property3.id)

puts "Created #{Slot.count} slots"

#Create Bookings and attach them to slots

booking1 = Booking.create(slot_id: slot1.id, user_id: user2.id)
booking2 = Booking.create(slot_id: slot2.id, user_id: user3.id)
booking3 = Booking.create(slot_id: slot3.id, user_id: user1.id)

puts "Created #{Booking.count} bookings"


#Create messages

chat_room1 = ChatRoom.create(title: user1.name)
chat_room2 = ChatRoom.create(title: user2.name)
chat_room3 = ChatRoom.create(title: user3.name)

puts "Created #{ChatRoom.count} chat rooms"

message1 = Message.create(content: "Hello, I'm interested in your property", user_id: user1.id, property_id: property2.id, chat_room_id: chat_room1.id)
message2 = Message.create(content: "Hello, I'm interested in your property", user_id: user2.id, property_id: property1.id, chat_room_id: chat_room2.id)
message3 = Message.create(content: "Hello, I'm interested in your property", user_id: user3.id, property_id: property3.id , chat_room_id: chat_room3.id)

puts "Created #{Message.count} messages"

