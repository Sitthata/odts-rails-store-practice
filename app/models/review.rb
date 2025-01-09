class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product

  validates :comment, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
