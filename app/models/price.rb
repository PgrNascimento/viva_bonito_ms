class Price < ApplicationRecord
  belongs_to :tour
  enum season_type: { low_season: 0, high_season: 1 }
  validates :season_type, presence: true
end
