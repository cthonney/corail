class Property < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :messages
  has_many :slots
  has_many :chat_rooms, through: :messages
end
