class PricePresenter < SimpleDelegator
  def initialize(price)
    @price = price
  end

  def humanize_season_type
    Price.human_attribute_name(@price.season_type.to_sym)
  end
end
