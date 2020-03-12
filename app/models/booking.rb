class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date, :no_dates_in_past, :validate_other_booking_overlap
  validates :status, presence: true, inclusion: { in: ["En Attente", "Confirmée"] }

  def confirm
    self.status = "Confirmée"
    save
  end

  def period
    start_date..end_date
  end


  private

  def validate_other_booking_overlap
    sql = ":end_date >= start_date and end_date >= :start_date"
    existing_bookings = Booking.where(product_id: self.product_id)
    is_overlapping = existing_bookings.where(sql, start_date: self.start_date, end_date: self.end_date).exists?
    errors.add(:overlaps_with_other, "Le produit n'est pas disponible à cette date") if is_overlapping
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end

  def no_dates_in_past
    if start_date < Date.today
      errors.add(:start_date, "ne peux pas être dans le passé")
    end

    if end_date < Date.today
      errors.add(:end_date, "ne peux pas être dans le passé")
    end
  end
end
