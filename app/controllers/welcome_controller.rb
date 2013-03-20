class WelcomeController < ApplicationController
  def index
    @trip = current_user.trips.build if signed_in?
  end
end
