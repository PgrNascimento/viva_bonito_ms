require 'rails_helper'

feature 'User edit tour' do
  
  scenario 'successfully' do

    tour = create(:tour)
    new_name = 'Bike Rio Sucuri'

    visit edit_tour_path(tour)
    fill_in 'Nome', with: new_name
    click_on 'Atualizar Passeio'

    expect(page).to have_css('h1', text: new_name)

  end

  scenario 'with empty field' do

    tour = create(:tour)

    visit edit_tour_path(tour)
    fill_in 'Nome', with: ''
    click_on 'Atualizar Passeio'

    expect(page).to have_content 'Não foi possível atualizar o passeio'

  end

end
