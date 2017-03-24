class HomeController < ApplicationController

  def index
    @tours = Tour.all
    @from = params[:from]
    @to = params[:to]
  end

  def filter_period
    @deucerto = 'Haha'
    @h2 = 'Preços para o período entre 2017-02-09 e 2017-02-10'
    @tours = Tour.all
    render 'index'
  end

end
