class WelcomeController < ApplicationController
  def show
    @destinations = Destination.all
  end

end
