class Event < ApplicationRecord
  has_many :reports 
  validates :title, presence: true
  validates :date, presence: true
end
