class ToursController < ApplicationController
  def show
    @tour = Tour.find(params[:id])
    @prices = @tour.prices.where("end_date >= ?",Date.today)
  end
end
