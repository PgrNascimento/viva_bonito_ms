require 'rails_helper'

RSpec.describe Price, :type => :model do

  it 'should have dates with valid period' do
    tour = create(:tour)
    price = Price.create(start_date: Date.today, end_date: Date.today - 2.days,
                        tour: tour, adult_price: 50, child_price: 25, baby_price: 5,
                        season_type: Price.season_types[:high_season])
    expect(price.errors[:end_date]).to include('Preço com Vigência Inválida')
  end

  it 'should be invalid' do
    tour = create(:tour)
    price = build(:price, start_date: Date.today, end_date: Date.today - 2.days, tour: tour)
    expect(price).to be_invalid
  end

  it 'should be invalid' do
    tour = create(:tour)
    price = build(:price, start_date: Date.today, end_date: Date.today + 10.days, tour: tour)
    expect(price).to be_valid
  end

  context "not fill the form" do
    it 'should be valid' do
      price = Price.create()

      expect(price).not_to be_valid
      expect(price.errors[:tour]).to include("não pode ficar em branco")
      expect(price.errors[:start_date]).to include("não pode ficar em branco")
      expect(price.errors[:end_date]).to include("não pode ficar em branco")
      expect(price.errors[:adult_price]).to include("não pode ficar em branco")
      expect(price.errors[:child_price]).to include("não pode ficar em branco")
      expect(price.errors[:baby_price]).to include("não pode ficar em branco")
   end
 end
end
