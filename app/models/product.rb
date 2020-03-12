class Product < ApplicationRecord
  CATEGORIES = ["skis", "snowboard", "batons", "skis + batons", "casque", "chaussures de ski", "boots de snowboard", "vêtements", "skis + batons + chaussures"]
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true,  inclusion: { in: CATEGORIES }
  validates :address, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
