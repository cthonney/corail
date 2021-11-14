class Booking < ApplicationRecord
  belongs_to :buyer, foreign_key: "user_id", class_name: "User"
  belongs_to :slot
  # has_one :property, through: :slots
  # has_one :owner, foreign_key: "user_id", class_name: "User", through: :properties
end
