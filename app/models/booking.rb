class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :reviews

  # validate presence of references
  validates :user, :pet, presence: true
end
