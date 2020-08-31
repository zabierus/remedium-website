class ApplicationDecorator < Draper::Decorator
  def creation_date
    model.created_at.strftime("%B %d, %Y")
  end
end
