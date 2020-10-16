require 'open-uri'
class ApplicationController < ActionController::Base
  include ApplicationHelper
  # csrf
  protect_from_forgery with: :exception
end
