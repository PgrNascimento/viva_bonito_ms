class PricesController < ApplicationController

  before_action :set_price, only: [:edit, :update]

  def new
    @price = Price.new
    @season_types = season_types
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to @price
    else
      @season_types = season_types
      flash[:error] = 'Não foi possível criar o preço'
      render :new
    end
  end

  def show
    @price = PricePresenter.new(Price.find(params[:id]))
  end

  def edit
    @season_types = season_types
  end

  def update

    if @price.update(price_params)
      redirect_to @price
    else
      @season_types = season_types
      flash[:error] = 'O preço não pode ser atualizado'
      render :edit
    end
  end

  private

  def price_params
    params.require(:price).permit(:tour_id, :start_date, :end_date, :adult_price,
                                  :child_price, :baby_price, :season_type)
  end

  def set_price
    @price = Price.find(params[:id])
  end

  def season_types
    Price.season_types.map do |key, _|
      [Price.human_attribute_name(key.to_sym), key]
    end
  end
end
