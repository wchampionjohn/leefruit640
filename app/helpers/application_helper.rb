module ApplicationHelper
  def current_path
    current_uri = request.env['PATH_INFO']
    Rails.application.routes.recognize_path(current_uri)
  end
end
