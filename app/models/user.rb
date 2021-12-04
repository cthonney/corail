class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :properties
  has_many :bookings
  has_many :messages
  has_many :chat_rooms, through: :properties
  has_many :chat_rooms, through: :messages
  has_many :slots, through: :properties
  has_one_attached :avatar
end
