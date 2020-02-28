class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :booking, presence: true
end
