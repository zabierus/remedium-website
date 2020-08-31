class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :user
  validate :validate

  def to_json
    return nil unless event_type

    {
      id: id,
      start: start_at,
      end: end_at,
      title: title,
      color: event_type.color_rgb,
      textColor: event_type.font_color_rgb,
      event_type_id: event_type.id,
      user_email: user&.email || "",
      user_name: user&.full_name || "",
    }
  end

  private

  def validate
    unless event_type
      errors.add(:base, "NO EVENT TYPE")
      false
    end
    true
  end
end
