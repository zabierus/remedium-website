class EventType < ApplicationRecord
  has_many :events
  validates :name, uniqueness: true

  def default
    EventType.find_by(default: true)
  end
end
