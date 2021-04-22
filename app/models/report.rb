class Report < ApplicationRecord
  belongs_to :event
  validates :expectations, presence: true
  validates :actual_events, presence: true
  validates :lessons, presence: true
  validates :next_time, presence: true
  
  has_one :user, through: :events
end
