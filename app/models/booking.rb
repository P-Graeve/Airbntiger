class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  # validate presence of references
  validates :user, :pet, presence: true
  validates :user, uniqueness: { scope: :pet }
end
