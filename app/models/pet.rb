class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
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

  def distance
    5
  end
end
