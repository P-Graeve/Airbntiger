class User < ApplicationRecord
  has_many :bookings
  has_many :pets
  has_many :reviews
  has_one :geolocation
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
