class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :content, presence: true
  validates :rating, presence: true
  def owner
    game.user
  end

  def renter
    user
  end
end
