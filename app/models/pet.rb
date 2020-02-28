class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  # constant TYPES has array of all allowed types of pets
  PET_TYPES = %w(Dog Hamster Cat Tiger Lion Rhino Fish Turtle Iguana Rat Parrot)

  # validate if name is present
  validates :name, presence: true
  # validate if price is present and is >= 0
  validates :price_in_eur, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validate if the description is there and has more than 140 characters
  validates :description, presence: true
  # validate if the type of part of Pet::TYPES
  validates :pet_type, presence: true, inclusion: { in: PET_TYPES }

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :pet_type ],
    associated_against: {
      user: [ :username ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def distance(geolocation)
    # calculate the amount of distance between the current user and the user that belongs this pet
    pet = user.geolocation
    user = geolocation
    Geocoder::Calculations.distance_between([pet.latitude, pet.longtitude], [user.latitude, user.longtitude]).round
  end

  def occupied_dates
    str = bookings.map do |booking|
      "#{booking.start_date.strftime('%y-%m-%d')}|#{booking.end_date.strftime('%y-%m-%d')}"
    end.join('|')
  end
end
