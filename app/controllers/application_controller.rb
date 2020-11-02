class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ProjectsHelper

  # protect_from_forgery(options = {})
  # Turn on request forgery protection. Bear in mind that GET and HEAD requests are not checked.

  # :with - Set the method to handle unverified request.
  # :exception - Raises ActionController::InvalidAuthenticityToken exception.

  protect_from_forgery with: :exception

end
