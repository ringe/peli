class Playthrough < ApplicationRecord
  belongs_to :player

  scope :this_week, -> { weeks_ago }
  scope :last_week, -> { weeks_ago(1) }
  scope :weeks_ago, ->(week = 0) {
    monday = (Date.today - week.weeks).beginning_of_week(:monday)
    sunday = (Date.today - week.weeks).end_of_week(:monday)
    where(started_at: monday..sunday)
  }
end
