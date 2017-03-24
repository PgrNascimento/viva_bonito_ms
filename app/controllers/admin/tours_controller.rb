module Admin
  class ToursController < ApplicationController
    layout 'admin_application'
    def index
      @tours = Tour.all.order(:name)
    end
  end
end
