class HomeController < ApplicationController

  def index
  end

  def filter_period
    @start_date = Date.parse(params[:filter_from])
    @end_date = Date.parse(params[:filter_to])

    @date_range = @start_date.step(@end_date, 1)
    @tours = Tour.all

    render 'index'
  end

end
