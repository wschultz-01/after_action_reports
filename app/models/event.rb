class Event < ApplicationRecord
  has_many :reports, dependent: :destroy
  validates :title, presence: true
  validates :date, presence: true
end
