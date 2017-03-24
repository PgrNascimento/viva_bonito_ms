require 'rails_helper'

RSpec.describe Price, :type => :model do

  it 'should have dates with valid period' do
    tour = create(:tour)
    price = Price.create(start_date: Date.today, end_date: Date.today - 2.days,
                        tour: tour, adult_price: 50, child_price: 25, baby_price: 5,
                        season_type: Price.season_types[:high_season])
    expect(price.errors[:end_date]).to include('Preço com Vigência Inválida')
  end
end
