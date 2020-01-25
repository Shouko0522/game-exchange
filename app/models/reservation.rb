class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  def owner
    game.user
  end

  def renter
    user
  end
end
