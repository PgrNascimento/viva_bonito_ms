module Admin
  class ToursController < ApplicationController
    def index
      @tours = Tour.all
    end
  end
end
