require 'rails_helper'

feature 'User creates tour' do
  scenario 'successfully' do
    tour = create(:tour)

    visit new_tour_path

    fill_in 'Nome', with: tour.name
    fill_in 'Descrição', with: tour.description
    fill_in 'Categoria', with: tour.category
    fill_in 'Atrativo', with: tour.attraction
    fill_in 'Duração', with: tour.duration
    fill_in 'Preço por Adulto', with: tour.adult_price
    fill_in 'Preço por Criança', with: tour.child_price
    fill_in 'Preco por Bebê', with: tour.baby_price
    fill_in 'Distância', with: tour.distance

    click_on 'Salvar Passeio'

     expect(page).to have_content tour.name
     expect(page).to have_content tour.description
     expect(page).to have_content tour.category
     expect(page).to have_content tour.attraction
     expect(page).to have_content tour.duration
     expect(page).to have_content tour.adult_price
     expect(page).to have_content tour.child_price
     expect(page).to have_content tour.baby_price
     expect(page).to have_content tour.distance

  end

end
