class Geolocation < ApplicationRecord
  belongs_to :user

  validates :latitude, :longtitude, presence: true
end
