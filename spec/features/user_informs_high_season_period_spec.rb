require 'rails_helper'

feature 'user informs high season period' do
  before(:each) do
    user = create(:user, email: 'email@email.com', password: 'epanenem')
    sign_in user
  end

  scenario 'successfully' do
    high_season = create(:high_season)

    visit dashboard_path

    click_on "Nova Temporada"

    fill_in 'Nome',     with: high_season.name
    fill_in 'Início',   with: high_season.start_date
    fill_in 'Fim',      with: high_season.end_date

    
    click_on 'Salvar'



    expect(page).to have_content(high_season.name)
    expect(page).to have_content(high_season.start_date)
    expect(page).to have_content(high_season.end_date)

  end

  scenario 'with an end_date that is smaller than the start_date' do

    high_season = build(:high_season,name:'Feriado', start_date: '2016-01-05', end_date: '2015-01-05')

    visit new_admin_high_season_path

    fill_in 'Nome',     with: high_season.name
    fill_in 'Início',   with: high_season.start_date
    fill_in 'Fim',      with: high_season.end_date

    click_on 'Salvar'

    expect(page).to have_content('Período inválido.')
    expect(page).to have_content('Não foi possível salvar a Alta Temporada')
    expect(page).to have_field('Nome', with: 'Feriado' )
    expect(page).to have_field('Início', with: '2016-01-05' )
    expect(page).to have_field('Fim', with: '2015-01-05' )

  end

  scenario 'without any information' do

    visit new_admin_high_season_path
    click_on 'Salvar'

    expect(page).to have_content('Não foi possível salvar a Alta Temporada')

  end

end
