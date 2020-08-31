module ApplicationHelper
  def active_class(*controller)
    "active" if controller.include?(params[:controller])
  end

  def active_class_alt(page)
    "active" if current_page?(page)
  end
end
