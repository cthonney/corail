class Slot < ApplicationRecord
  belongs_to :property
  has_one :owner, foreign_key: "user_id", class_name: "User", through: :properties
  has_many :buyer, foreign_key: "user_id", class_name: "User", through: :bookings
end
