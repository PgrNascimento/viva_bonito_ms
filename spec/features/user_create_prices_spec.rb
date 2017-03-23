require 'rails_helper'

feature 'User create prices' do
  scenario 'successfully' do
    tour = create(:tour)
    price = Price.new(tour: tour, start_date: Date.today,
                        end_date: Date.today + 3.days,
                        adult_price: 100, child_price: 50, baby_price: 5,
                        season_type: Price.season_types[:high_season])

    visit new_price_path

    select tour.name, from: 'Passeio'
    fill_in 'Data Inicial', with: price.start_date
    fill_in 'Data Final', with: price.end_date
    fill_in 'Preço por Adulto', with: price.adult_price
    fill_in 'Preço por Criança', with: price.child_price
    fill_in 'Preço por Bebê', with: price.baby_price
    choose Price.human_attribute_name(price.season_type.to_sym)

    click_on 'Criar Preço'

    expect(page).to have_content price.tour.name
    expect(page).to have_content price.start_date
    expect(page).to have_content price.end_date
    expect(page).to have_content price.adult_price
    expect(page).to have_content price.child_price
    expect(page).to have_content price.baby_price
    expect(page).to have_content Price.human_attribute_name(price.season_type.to_sym)
  end
end
