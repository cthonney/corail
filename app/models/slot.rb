class Slot < ApplicationRecord
  belongs_to :property
  has_many :bookings
end
