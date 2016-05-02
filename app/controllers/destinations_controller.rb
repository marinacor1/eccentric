class DestinationsController < ApplicationController

  def show
    @destination = Destination.find_by(planet: params[:planet])
    if @destination.nil?
      render file: "/public/404"
    end

  end

end
