class Game < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :price, presence: true
  validates :platform, presence: true

  def owner
    user
  end
end
