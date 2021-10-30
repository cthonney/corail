class Booking < ApplicationRecord
  belongs_to :buyer, foreign_key: "user_id", class_name: "User"
  belongs_to :slot
end
