# frozen_string_literal: true

module Visible
  def should_be_visible?(current_user = nil)
    return false if for_logged && !current_user.present?

    if self.class.class_name != "Upload" && is_active
      return false if visible_from && DateTime.now < visible_from
      return false if visible_to && DateTime.now > visible_to
    end

    true
  end

  def visible_from_and_visible_to
    if visible_from && visible_to
      errors.add :end_date, t("admin.visible_to_lower_than_visible_from") if visible_to < visible_from
    end
  end
end
