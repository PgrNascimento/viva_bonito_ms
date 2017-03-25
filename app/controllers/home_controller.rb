class HomeController < ApplicationController

  def index
  end

  def filter_period
    @start_date = params[:filter_from]
    @end_date = params[:filter_to]

    @date_range = @start_date..@end_date

    @tours = Tour.all

    @date_range.each do |d|
      Tour.all.each do |t|
        manager = TourPriceManager.new(t,d)
        this_price = manager.tour_price_with_season
        puts this_price.adult_price
      end
    end

    render 'index'
  end

end
