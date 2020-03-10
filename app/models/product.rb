class Product < ApplicationRecord
  CATEGORIES = ["skis", "snowboard", "batons", "skis + batons", "casque", "chaussures de ski", "boots de snowboard"]
  has_many_attached :photos
  has_many :bookings
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true,  inclusion: { in: CATEGORIES }
  validates :address, presence: true
  validates :description, presence: true
end
