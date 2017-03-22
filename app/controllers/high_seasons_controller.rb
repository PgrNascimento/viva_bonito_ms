class HighSeasonsController < ApplicationController

  def new
    @high_season = HighSeason.new
  end

  def create
    high_season_params = params.require(:high_season).permit(:name,:start_date,:end_date)
    @high_season = HighSeason.new(high_season_params)
    if @high_season.save
      redirect_to @high_season
    else
      flash[:error] = "Informações não foram salvas."
      render new_high_season_path
    end
  end

  def show
    @high_season = HighSeason.find(params[:id])
  end

end
