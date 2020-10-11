require 'open-uri'
class ApplicationController < ActionController::Base
  # csrf
  protect_from_forgery with: :exception
end
