class ToursController < ApplicationController
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

  def show
    @tour = Tour.find(params[:id])
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

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :category_id, :attraction,
                                  :duration, :adult_price, :child_price, :baby_price,
                                  :distance)
  end
end
