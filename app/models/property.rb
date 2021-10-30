class Property < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :messages
end
