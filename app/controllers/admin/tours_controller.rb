module Admin
  class ToursController < ApplicationController
    layout 'admin_application'

    def index
      @tours = Tour.all.order(:name)
    end

    def new
      @tour = Tour.new
    end

    def create
      @tour = Tour.new(tour_params)
      if @tour.save
        redirect_to @tour
      else
        flash[:notice] = 'Passeio não pode ser cadastrado, verifique os dados'
        render :new
      end
    end

    def edit
      @tour = Tour.find(params[:id])
    end

    def update
      @tour = Tour.find(params[:id])
      if @tour.update(tour_params)
        redirect_to @tour
      else
        flash[:notice] = 'Não foi possível atualizar o passeio'
        render :edit
      end
    end

    def destroy
      Tour.find(params[:id]).destroy
      redirect_to :back
    end

    private
    def tour_params
      params.require(:tour).permit(:name, :description, :category_id, :attraction,
                                    :duration, :adult_price, :child_price, :baby_price,
                                    :distance,:site)
    end
  end
end
