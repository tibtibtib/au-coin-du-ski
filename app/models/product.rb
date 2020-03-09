class Product < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
