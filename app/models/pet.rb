class Pet < ApplicationRecord
  has_many :bookings
  has_one_attached :photo
  # constant TYPES has array of all allowed types of pets
  PET_TYPES = %w(dog hamster cat tiger lion rhino fish turtle iguana rat parrot)

  # validate if name is present
  validates :name, presence: true
  # validate if price is present and is >= 0
  validates :price_in_eur, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validate if the description is there and has more than 140 characters
  validates :description, presence: true, length: { minimum: 140 }
  # validate if the type of part of Pet::TYPES
  validates :pet_type, presence: true, inclusion: { in: PET_TYPES }
end
