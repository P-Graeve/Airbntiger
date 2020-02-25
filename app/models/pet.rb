class Pet < ApplicationRecord
  # constant TYPES has array of all allowed types of pets
  TYPES = %w(dog hamster cat tiger lion rhino fish turtle iguana rat parrot)

  # validate if name is present
  validates :name, presence: true
  # validate if price is present and is >= 0
  validates :price_in_eur, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validate if the description is there and has more than 140 characters
  validates :description, presence: true, length: { minimum: 140 }
  # validate if the type of part of Pet::TYPES
  validates :type, presence: true, inclusion: { in: TYPES }
end
