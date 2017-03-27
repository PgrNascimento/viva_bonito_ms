class HomeController < ApplicationController

  def index
  end

  def filter_period
    @start_date = params[:filter_from]
    @end_date = params[:filter_to]

    @date_range = @start_date..@end_date
    @tours = Tour.all

    render 'index'
  end

end
