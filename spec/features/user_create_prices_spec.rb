require 'rails_helper'

feature 'User create prices' do
  scenario 'successfully' do

    price = build(:price)

    human_price = Price.human_attribute_name(price.season_type.to_sym)

    visit new_price_path

    select price.tour.name, from: 'Passeio'
    fill_in 'Data Inicial', with: price.start_date
    fill_in 'Data Final', with: price.end_date
    fill_in 'Preço por Adulto', with: price.adult_price
    fill_in 'Preço por Criança', with: price.child_price
    fill_in 'Preço por Bebê', with: price.baby_price
    choose human_price

    click_on 'Criar Preço'

    expect(page).to have_content price.tour.name
    expect(page).to have_content price.start_date
    expect(page).to have_content price.end_date
    expect(page).to have_content price.adult_price
    expect(page).to have_content price.child_price
    expect(page).to have_content price.baby_price
    expect(page).to have_content human_price
  end

  scenario 'with invalid data' do
    visit new_price_path

    click_on 'Criar Preço'

    expect(page).to have_content 'Não foi possível criar o preço'

  end

  scenario ' with invalid period' do
    price = build(:price, start_date: Date.today, end_date: Date.today - 1.day)

    human_price = Price.human_attribute_name(price.season_type.to_sym)

    visit new_price_path

    select price.tour.name, from: 'Passeio'
    fill_in 'Data Inicial', with: price.start_date
    fill_in 'Data Final', with: price.end_date
    fill_in 'Preço por Adulto', with: price.adult_price
    fill_in 'Preço por Criança', with: price.child_price
    fill_in 'Preço por Bebê', with: price.baby_price
    choose human_price

    click_on 'Criar Preço'

    expect(page).to have_content 'Preço com Vigência Inválida'

  end
end
