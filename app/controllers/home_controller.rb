class HomeController < ApplicationController

  def index
    @tours = Tour.all
  end

end
