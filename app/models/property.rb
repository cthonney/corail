class Property < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :messages
  has_many :slots
  has_many :chat_rooms, through: :messages
  #Add photos
  has_many_attached :photos
end
