require 'rails_helper'

feature 'User creates tour' do
  scenario 'successfully' do

    category = create(:category, name: 'Flutuação')

    tour = build(:tour, category: category)

    visit new_tour_path

    fill_in 'Nome', with: tour.name
    fill_in 'Descrição', with: tour.description
    select  tour.category.name, from: 'Categoria'
    fill_in 'Atrativo', with: tour.attraction
    fill_in 'Duração', with: tour.duration
    fill_in 'Preço por Adulto', with: tour.adult_price
    fill_in 'Preço por Criança', with: tour.child_price
    fill_in 'Preço por Bebê', with: tour.baby_price
    fill_in 'Distância', with: tour.distance

    click_on 'Salvar Passeio'

     expect(page).to have_content tour.name
     expect(page).to have_content tour.description
     expect(page).to have_content tour.category.name
     expect(page).to have_content tour.attraction
     expect(page).to have_content tour.duration
     expect(page).to have_content tour.adult_price
     expect(page).to have_content tour.child_price
     expect(page).to have_content tour.baby_price
     expect(page).to have_content tour.distance

  end

  scenario 'With invalid data' do
    visit new_tour_path

    click_on 'Salvar Passeio'

    expect(page).to have_content 'Passeio não pode ser cadastrado, verifique os dados'

  end

end
