class ApplicationController < ActionController::Base
  ###all 4 controllers in clearance github
  include Clearance::Controller 
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login

  # def index
  #   current_user.articles
  # end

end
