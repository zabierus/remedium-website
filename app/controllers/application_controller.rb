class ApplicationController < ActionController::Base
  include SiteSettings
  before_action :site_settings

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred"
    render(file: File.join(Rails.root, "public/404.html"), layout: false, status: 404)
  end

  def not_found
    raise ActionController::RoutingError.new(params[:path])
  end
end
