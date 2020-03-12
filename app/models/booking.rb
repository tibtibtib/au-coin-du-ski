class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date, :no_dates_in_past
  validates :status, presence: true, inclusion: { in: ["En attente", "Confirmée"] }

  def confirm
    self.status = "Confirmée"
    save
  end

  private

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
