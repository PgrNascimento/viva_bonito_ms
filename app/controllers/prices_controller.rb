class PricesController < ApplicationController
  def new
    @price = Price.new
    @season_types = Price.season_types.to_a.map do |season|
      OpenStruct.new(label: Price.human_attribute_name(season.first.to_sym),
                     value: season.first)
    end
  end

  def create
    @price = Price.new(price_params)
    @price.save
    redirect_to @price
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:tour_id, :start_date, :end_date, :adult_price,
                                  :child_price, :baby_price, :season_type)
  end


end
