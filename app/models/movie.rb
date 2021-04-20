class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks?
  # has_many :lists

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true

  private

  def check_for_bookmarks?
    errors.add(:base, "Cannot delete movie that is in a list") unless bookmarks.count == 0
    errors.blank?
  end
end
