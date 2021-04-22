class Event < ApplicationRecord
  belongs_to :user
  has_many :reports, dependent: :destroy
  validates :title, presence: true
  validates :date, presence: true
end
