class Property < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :messages
  has_many :slots
  has_many :chat_rooms, through: :messages
  #Add photos
  has_many_attached :photos
end
