require 'rails_helper'

feature 'Admin view dashboard' do
  before(:each) do
    user = create(:user, email: 'email@email.com', password: 'epanenem')
    sign_in user
  end

  scenario 'successfully' do
    visit dashboard_path

    expect(page).to have_content('Passeios')
    expect(page).to have_content('Categorias')
  end

  scenario 'and clicks categories' do
    category = create(:category, name: 'Aventura')
    another_category = create(:category, name: 'Chora Menino')

    visit dashboard_path

    click_on 'Categorias'

    expect(page).to have_content(category.name)
    expect(page).to have_content(another_category.name)

    expect(page).to have_content('Nova Categoria')
  end

  scenario 'and clicks tours' do
    category = create(:category)
    tour = create(:tour, category: category)
    another_tour = create(:tour, name: 'Chora Menino', category: category)

    visit dashboard_path

    click_on 'Passeios'

    expect(page).to have_current_path(admin_tours_path)
    expect(page).to have_content(tour.name)
    expect(page).to have_content(another_tour.name)

    expect(page).to have_content('Novo Passeio')
  end
end
