class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :all_destinations
  before_action :set_trip

  helper_method :current_user

  def logged_in_user
    unless current_user
      render file: "/public/404"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def all_destinations
    @destinations = Destination.all
  end

  def set_trip
    @trip = Trip.new(session[:trip])
  end


end
