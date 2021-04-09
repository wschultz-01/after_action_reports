class Report < ApplicationRecord
  belongs_to :event
  validates :expectations, presence: true
  validates :actual_events, presence: true
  validates :lessons, presence: true
  validates :next_time, presence: true
end
